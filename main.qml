import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Row {
        width: parent.width
        height:25
        Rectangle {
            width: parent.width / 3
            height: parent.height
            id: rect
            border.color: "black"
            border.width: 1
            color: "lightblue"
        TextInput {
           width: parent.width
           text: "Some text"
           padding: 5
        }
        }
    }
}
