pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
    readonly property string time: Qt.formatDateTime(clock.date, "ddd dd MMM hh:mm AP")
}
