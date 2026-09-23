import QtQuick

Rectangle {
    implicitWidth: Math.max(implicitHeight, text.implicitWidth + 8)
    implicitHeight: Theme.barHeight - Theme.gap * 2
    width: implicitWidth
    height: implicitHeight
    radius: Theme.radius 

    color: Theme.color8

    Text {
        id: text
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: 3
        }

        text: Time.time
        color: Theme.fg
        font.family: Theme.font
        font.pixelSize: Theme.fontSize
    }
}