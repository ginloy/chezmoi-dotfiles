import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "./widgets"
import "./modules"

Scope {
    property string time
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: root
            visible: true
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: child.implicitHeight + child.anchors.topMargin + child.anchors.bottomMargin
            color: Colors.surface

            RowLayout {
                id: child
                anchors.fill: parent
                anchors.margins: 0.8 * Globals.rem
                anchors.topMargin: anchors.margins / 2
                anchors.bottomMargin: anchors.topMargin

                property real sideWidth: Math.max(leftGroup.width, rightGroup.width)

                RowLayout {
                    id: leftGroup
                    spacing: 0.6 * Globals.rem
                    Layout.preferredWidth: Math.min(parent.sideWidth, parent.width - rightGroup.width - centerGroup.width)

                    ActiveWindow {
                        Layout.fillWidth: true
                    }
                }

                RowLayout {
                    id: centerGroup
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.fillWidth: false
                    spacing: Globals.rem

                    readonly property real sideWidth: Math.max(centerLeft.width, centerRight.width)
                    RowLayout {
                        id: centerLeft
                        Layout.preferredWidth: parent.sideWidth
                        layoutDirection: Qt.RightToLeft
                        Battery {}
                        Box {
                            child: Label {
                                text: `C ${Math.round(SystemInfo.cpuUsage * 100)}%`
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                        }
                    }
                    RowLayout {
                        id: centerCenter
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                        Layout.fillWidth: false
                        Workspaces {}
                    }
                    RowLayout {
                        id: centerRight
                        Layout.preferredWidth: parent.sideWidth
                        Speaker {}
                    }
                }

                RowLayout {
                    id: rightGroup
                    Layout.preferredWidth: Math.min(parent.sideWidth, parent.width - leftGroup.width - centerGroup.width)
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                    layoutDirection: Qt.RightToLeft
                    spacing: 0.6 * Globals.rem

                    Label {
                        text: Time.time
                    }

                    Tray {}

                    Item {
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}
