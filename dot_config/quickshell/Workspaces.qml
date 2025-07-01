import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "./widgets"

Box {
    id: root
    readonly property list<HyprlandWorkspace> workspaces: Hyprland.workspaces.values
    color: Colors.surface_container
    radius:  0.8 * Globals.rem
    padding: 0.3* Globals.rem
    function getWorkspace(id) {
        return workspaces.find(w => w.id === id);
    }
    child: RowLayout {
        spacing: 0.4 * Globals.rem
        Repeater {
            model: 9
            Box {
                id: button
                required property int index
                readonly property var workspace: getWorkspace(index + 1)

                radius: 0.6 * Globals.rem
                padding: 0.2 * Globals.rem
                leftPadding: workspace?.focused ? 1 * Globals.rem : 0.3 * Globals.rem
                rightPadding: leftPadding

                function getBgColor(): string {
                    if (workspace?.focused) {
                        return area.containsMouse ? Colors.primary_container : Colors.primary
                    } else {
                        return area.containsMouse ? Colors.surface_container_highest : "transparent"
                    }
                }
                function getFgColor(): string {
                    if (workspace?.focused) {
                        return area.containsMouse ? Colors.on_primary_container : Colors.on_primary
                    }
                    return Colors.on_surface
                }

                color: getBgColor()
                MouseArea {
                    id: area
                    hoverEnabled: true
                    anchors.fill: parent
                    onClicked: {
                        Hyprland.dispatch(`workspace ${parent.index + 1}`)
                    }
                }

                child: Label {
                    text: (button.index + 1).toString()
                    color: button.getFgColor()
                    font.pixelSize: button.workspace?.focused ? Globals.rem : 0.8 * Globals.rem
                    font.weight: button.workspace ? (button.workspace.focused ? Font.ExtraBold : Font.Normal) : Font.Thin
                }
            }
        }
    }
}
