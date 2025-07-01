import QtQuick
import QtQuick.Controls as Qc
import ".."

Qc.Slider {
    id: root

    background: Rectangle {
        x: root.leftPadding
        y: root.topPadding + root.availableHeight / 2 - height / 2
        implicitWidth: Globals.rem * 5
        implicitHeight: Globals.rem * 0.2
        width: root.availableWidth
        height: implicitHeight
        radius: 2
        color: Colors.surface_container_highest

        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            color: Colors.primary
            radius: parent.radius
        }
    }
    handle: Rectangle {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        implicitWidth: Globals.rem * 1 
        implicitHeight: implicitWidth
        radius: implicitWidth / 2
        color: root.pressed ? Colors.primary_container : Colors.secondary
        border.color: Colors.outline
    }
}
