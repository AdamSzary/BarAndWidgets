import Quickshell
import QtQuick
import "../Panel"

PanelWindow {
    aboveWindows: false

    anchors {
        top: true
        left: true
    }

    implicitWidth: 1000
    implicitHeight: 400
    color: "transparent"

    Column {
        anchors.centerIn: parent
        spacing: 12

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Aporetic"
            font.pixelSize: 100
            color: Theme.fg
            text: WidgetTime.time
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Cozette"
            font.pixelSize: 20
            color: Theme.fg
            text: WidgetWeather.stats
        }
    }
}