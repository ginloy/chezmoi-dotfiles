import Quickshell.Services.SystemTray
import QtQuick.Layouts
import QtQuick
import "./widgets"

Box {
    color: Colors.surface_container
    padding: 0.4 * Globals.rem
    radius: 0.8 * Globals.rem
    visible: SystemTray.items.values.length > 0
    child: RowLayout {
        spacing: 3
        Repeater {
            id: repeater
            model: SystemTray.items
            TrayItem {
                required property var modelData
                item: modelData
            }
        }
    }
}
