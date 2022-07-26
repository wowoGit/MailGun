import QtQuick 2.5

Item {
    property alias lview: lview
    property alias rect: rect

     Rectangle {
         id:rect
        anchors.fill: parent
        radius: 5
        color: "white"

        ListView {
            id: lview
            anchors.fill: parent
            anchors.margins: {
                left: 10
                right: 10
                top: 15
                bottom: 15
            }

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

        }

    }
}
