import QtQuick
import QtQuick.Layouts
import "../widgets"
import ".."
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import Quickshell

Item {
    id: root
    implicitHeight: row.implicitHeight
    implicitWidth: row.implicitWidth
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
    }
    MouseArea {
        id: mainArea
        anchors.fill: row
        hoverEnabled: true
    }
    Timer {
        id: hideDelay
        interval: 500
        onTriggered: slider.visible = false
    }
    RowLayout {
        id: row
        readonly property PwNodeAudio audioNode: Pipewire.defaultAudioSink.audio
        readonly property real volume: audioNode.volume * 100
        property bool hovered: mainArea.containsMouse || iconArea.containsMouse
        onHoveredChanged: {
            if (!hovered) {
                hideDelay.start();
            } else {
                hideDelay.stop();
                slider.visible = true;
            }
        }
        visible: audioNode
        IconImage {
            implicitSize: Globals.rem
            function iconName(): string {
                if (parent.audioNode.muted) {
                    return "audio-volume-muted-symbolic";
                }
                if (parent.volume > 75) {
                    return "audio-volume-high-symbolic";
                }
                if (parent.volume < 25) {
                    return "audio-volume-low-symbolic";
                }
                return "audio-volume-medium-symbolic";
            }
            source: `image://icon/${iconName()}`
            MouseArea {
                id: iconArea
                anchors.fill: parent
                onClicked: {
                    row.audioNode.muted = !row.audioNode.muted;
                }
            }
        }

        Slider {
            id: slider
            visible: mainArea.containsMouse || iconArea.containsMouse
            from: 0
            to: 1
            value: parent.audioNode.volume
            onValueChanged: {
                parent.audioNode.volume = value;
            }
        }
        Label {
            text: `${Math.round(parent.volume)}%`
        }
    }
}
