import Quickshell
import Quickshell.Widgets
import QtQuick

IconImage {
    id: image
    required property var item

    source: item.icon
    implicitSize: Globals.rem * 1.2

    MouseArea {
        hoverEnabled: true
        anchors.fill: parent

        onClicked: {
            if (menu.visible) {
                menu.close();
            } else {
                menu.open();
            }
        }
    }

    QsMenuAnchor {
        id: menu
        anchor.item: image
        anchor.rect.y: image.height
        menu: item.menu
    }
}
