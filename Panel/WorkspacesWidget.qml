import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.I3


Row {
    id: root
    spacing: Theme.gap

    required property var screen
    readonly property string monitorName: screen ? screen.name : ""

    Repeater {
        model: I3.workspaces
        
        WorkspaceChip {
            required property var modelData

            visible: modelData.monitor && modelData.monitor.name === root.monitorName

            label: modelData.name
            active: modelData.active
            focused: modelData.focused
            urgent: modelData.urgent

            onClicked: modelData.activate()
        }
    }
}