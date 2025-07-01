pragma Singleton
import QtQuick
import Quickshell

Singleton {
    property string fontFamily: "Iosevka Nerd Font"
    property real fontPointSize: 12
    readonly property real rem: text.font.pixelSize

    Text {
      id: text
      visible: false
      text: "test"
      font.pointSize: fontPointSize
      font.family: fontFamily
    }
}
