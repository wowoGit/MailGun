import QtQuick 2.5

Item {

    width: 100
    height:25


    property alias text: input.text
    property alias input: input
    property alias text_rect: text_rect
    property alias color: text_rect.color
    Rectangle {
        id: text_rect
        width: parent.width
        height: parent.height
        color: "orange"
        border.color: Qt.lighter(color)
        radius: 5

    Text {
        id: input
        anchors.fill: parent
        anchors.margins: 4
        focus: true
    }
    }

}
