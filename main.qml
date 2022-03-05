import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.3

Window {
    width: 640
    height: 480
    minimumHeight: 200
    minimumWidth: 200
    visible: true
    title: qsTr("Hello World")
    id: mainwindow
    color: bgColor
    readonly property int defMargin: 10
    readonly property color bgColor: "#52b788"
    readonly property color fontColor: "#d8f3dc"
    readonly property color ctrlColor: "#2d6a4f"
    readonly property color fieldColor: "#d8f3dc"
    readonly property color eventColor: "#AEFEFF"

    Row {
        width: parent.width
        height:25
        Rectangle {
            width: parent.width / 3
            height: parent.height
            id: rect
            border.color: "black"
            border.width: 1
            radius: 5
            color: mainwindow.fieldColor
        TextInput {
           width: parent.width
           text: fd.fileUrl
           padding: 5
           color: mainwindow.fontColor
        }
        }

        RoundButton {
            anchors.leftMargin: 10
            height: 25
            width: 90
            text: "Choose File..."
            contentItem: Text {
                text: parent.text
                font: parent.font
                color: mainwindow.fontColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                height: 25
                width: 90
                border.color: parent.hovered ? "#4FBDBA" : "white"
                border.width: 1
                color: mainwindow.ctrlColor
                radius:5
            }
            onClicked: {
               fd.open()
            }

            FileDialog {
                id: fd
               folder: shortcuts.home

            }
        }
    }
}
