import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.UPower
import QtQuick.Layouts
import "./widgets"

Box {
    id: origin
    readonly property var device: UPower.displayDevice

    function iconName() {
        const state = device.state;
        const percentage = ("000" + Math.round(device.percentage * 10) * 10).slice(-3);
        const charging = state === UPowerDeviceState.Charging;

        var ret = `battery-${percentage}`;
        if (charging) {
            ret += "-charging";
        }
        return ret;
    }

    function icon() {
        const state = device.state;
        const charging = state === UPowerDeviceState.Charging;

        if (device.percentage >= 0.95) {
            if (charging) {
                return "󰂅";
            } else {
                return "󰁹";
            }
        }
        if (device.percentage >= 0.90) {
            if (charging) {
                return "󰂋";
            } else {
                return "󰂂";
            }
        }
        if (device.percentage >= 0.80) {
            if (charging) {
                return "󰂊";
            } else {
                return "󰂁";
            }
        }
        if (device.percentage >= 0.60) {
            if (charging) {
                return "󰂉";
            } else {
                return "󰁿";
            }
        }
        if (device.percentage >= 0.40) {
            if (charging) {
                return "󰂈";
            } else {
                return "󰁽";
            }
        }
        if (device.percentage >= 0.30) {
            if (charging) {
                return "󰂇";
            } else {
                return "󰁼";
            }
        }
        if (device.percentage >= 0.20) {
            if (charging) {
                return "󰂆";
            } else {
                return "󰁻";
            }
        }
        if (device.percentage >= 0.10) {
            if (charging) {
                return "󰢜";
            } else {
                return "󰁺";
            }
        }
        if (charging) {
            return "󰢟";
        } else {
            return "󰂎";
        }
    }
    child: RowLayout {
        id: content
        spacing: 0
        IconImage {
            source: `image://icon/${iconName()}`
            implicitSize: Globals.rem * 1.5
        }
        Label {
            id: label
            text: `${Math.round(device.percentage * 100)}%`
        }
    }
    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        onEntered: debounceTimer.start()
        onExited: {
            debounceTimer.stop();
            toolTip.visible = false;
        }
    }
    Timer {
        id: debounceTimer
        interval: 500
        repeat: false
        onTriggered: toolTip.visible = true
    }
    PopupWindow {
        id: toolTip
        visible: false
        implicitWidth: child.implicitWidth
        implicitHeight: child.implicitHeight
        anchor.item: origin
        color: "transparent"
        anchor.rect.y: origin.height + 2
        anchor.rect.x: origin.width / 2 - (this.width / 2)

        Box {
            id: child
            color: Colors.surface
            padding: 0.8 * Globals.rem
            function getText() {
                let totalSeconds;
                let prefix;
                if (device.state === 1) {
                    totalSeconds = device.timeToFull;
                    prefix = "Time to full: ";
                } else {
                    totalSeconds = device.timeToEmpty;
                    prefix = "Time to empty: ";
                }

                const hours = Math.floor(totalSeconds / 3600);
                const minutes = Math.floor(totalSeconds % 3600 / 60);
                return `${prefix}${hours} h ${minutes} min`;
            }
            child: Column {

                Label {
                    font.pixelSize: Globals.rem * 1.3
                    text: `${device.state === 2 ? "-" : "+"}${device.changeRate} W`
                }
                Label {
                    id: timeLabel
                    text: child.getText()
                }
            }
        }
    }
}
