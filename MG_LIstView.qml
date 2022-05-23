import QtQuick 2.5

Item {
    property alias lview: lview
    property alias rect: rect

    Rectangle {
        width: parent.width
        height: parent.height
        id: rect
        color: "green"

        ListView {
            width: parent.width
            height: parent.height
            id: lview
            delegate: Rectangle {
                color: "transparent"
                height: text.implicitHeight + 4
                width: lview.width
                Text {
                    id:text
                    font.pixelSize: 18
                    text: modelData
                }
            }
            highlight: Rectangle {
                color: "grey"
            }

        }

    }
}
