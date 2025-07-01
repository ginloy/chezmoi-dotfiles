import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: this.height
    implicitHeight: label.implicitHeight
    property alias name: button.icon.name
    property alias color: button.icon.color
    property alias source: button.icon.source

    CLabel {
        id: label
        visible: false
        text: "test"
    }
    Button {
        id: button
        anchors.centerIn: parent
        background: Item {}
        icon.color: "transparent"
        icon.width: root.height
        icon.height: root.height
    }
}
