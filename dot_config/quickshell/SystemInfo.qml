pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    readonly property real cpuUsage: cpuFile.usage
    FileView {
        id: cpuFile
        path: "/proc/stat"

        property real prevTotal: 0
        property real prevIdle: 0
        property real usage: 0

        function updateCpuUsage() {
            reload();
            waitForJob();
            const stats = text().split("\n")[0].trim().split(/\s+/).slice(1).map(parseFloat);
            const totalTime = stats.reduce((p, x) => p + x, 0);
            const idleTime = stats[3] + stats[4];

            const totalDelta = totalTime - prevTotal;
            const idleDelta = idleTime - prevIdle;

            prevTotal = totalTime;
            prevIdle = idleTime;
            usage = (totalDelta - idleDelta) / totalDelta;
        }
    }
    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            cpuFile.updateCpuUsage()
        }
    }
}
