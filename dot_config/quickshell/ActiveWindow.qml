import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import "./widgets"

Column {
  id: root

  property string className: ""
  property string title: ""
  onTitleChanged: {
    if (title.length === 0) {
      title = "Desktop"
    }
  }
  Connections {
    target: Hyprland
    function onRawEvent(event) {
      if (event.name === "activewindow") {
        const args = event.parse(2)
        root.className = args[0]
        root.title = args[1]
      }
    }
  }

  Label {
    text: className
    font.pixelSize: 0.6 * Globals.rem
    font.bold: true
    font.italic: true
    elide: Text.ElideRight
    maximumLineCount: 1
    width: parent.width
  }
  Label {
    text: title
    font.pixelSize: 0.8 * Globals.rem
    elide: Text.ElideRight
    maximumLineCount: 1
    width: parent.width
  }

  Process {
    running: true
    command: ["hyprctl", "activewindow"]
    stdout: SplitParser {
      onRead: data => {
        const line = data.trim()
        if (line.startsWith("class: ")) {
          root.className = line.slice(7)
        }
        if (line.startsWith("title: ")) {
          root.title = line.slice(7)
        }
      }
    }
  }
}
