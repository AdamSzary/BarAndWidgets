pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: weather

    property string stats: "Loading..."

    Process {
        id: weatherProc

        command: ["/home/szary/.config/quickshell/DesktopWidget/WeatherParser.nu"]
        running: true

        stdout: StdioCollector {
            id: collector
            onStreamFinished: weather.stats = collector.text
        }
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: weatherProc.running = true
    }
}