import QtQuick

Rectangle {
    id: chip

    property string label
    property bool active: false
    property bool focused: false
    property bool urgent: false

    signal clicked(int button)

    implicitWidth: Math.max(implicitHeight, text.implicitWidth + 8)
    implicitHeight: Theme.barHeight - Theme.gap * 2
    width: implicitWidth
    height: implicitHeight
    radius: Theme.radius 

    color: urgent ? Theme.color1
         : focused ? Theme.color8
         : active ? Theme.color6
         : Theme.color0

    Text {
        id: text
        anchors.centerIn: parent
        text: chip.label
        color: Theme.fg
        font.family: Theme.font
        font.pixelSize: Theme.fontSize
    }
}