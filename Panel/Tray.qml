import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

// StatusNotifier system tray. Left-click activates, middle-click does the
// secondary action, right-click opens the item's native menu.
RowLayout {
    anchors {
        centerIn: parent
    }

    id: root
    // the PanelWindow this tray lives in, needed to anchor context menus
    property var panelWindow

    visible: SystemTray.items.values.length > 0
    spacing: Theme.spacing + 2

    Repeater {
        model: SystemTray.items

        Item {
            id: entry
            required property var modelData
            Layout.alignment: Qt.AlignVCenter
            implicitWidth: 18
            implicitHeight: 18

            Image {
                anchors.fill: parent
                source: entry.modelData.icon
                sourceSize.width: 18
                sourceSize.height: 18
                fillMode: Image.PreserveAspectFit
                smooth: true
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton
                onClicked: mouse => {
                    const item = entry.modelData;
                    if (mouse.button === Qt.LeftButton) {
                        if (item.onlyMenu) openMenu();
                        else item.activate();
                    } else if (mouse.button === Qt.MiddleButton) {
                        item.secondaryActivate();
                    } else if (mouse.button === Qt.RightButton) {
                        openMenu();
                    }
                }
                function openMenu() {
                    const item = entry.modelData;
                    if (!item.hasMenu || !root.panelWindow) return;
                    const p = entry.mapToItem(null, 0, entry.height + Theme.gap);
                    item.display(root.panelWindow, p.x, p.y);
                }
                onWheel: wheel =>
                    entry.modelData.scroll(wheel.angleDelta.y, false)
            }
        }
    }
}
