import QtQuick
import QtQuick.Layouts
import Quickshell

Scope {

    Variants {
        model: Quickshell.screens;
 
        PanelWindow {
            id: panel
            required property var modelData

            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            color: Theme.bg

            implicitHeight: Theme.barHeight

            RowLayout {
                id: leftRow
                anchors.left: parent.left
                anchors.leftMargin: Theme.gap + 2
                y: (Theme.barHeight - height) / 2
                spacing: Theme.gap

                WorkspacesWidget {
                    screen: panel.modelData
                    Layout.alignment: Qt.AlignVCenter
                }
            }

            Tray {}

            RowLayout {
                id: rightRow
                anchors.right: parent.right
                anchors.rightMargin: Theme.gap + 2
                y: (Theme.barHeight - height) / 2
                spacing: Theme.gap

                ClockWidget {}
            }
        }
    }
}