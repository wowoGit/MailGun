import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    property alias animOpen: animOpen
    property alias animClose: animClose
    id: root;
    x: 0
    y:0
    width: 150;
    anchors {
        bottom:parent.bottom
        top: parent.top
    }
    Rectangle {
        anchors.fill: parent
        //color: Qt.rgba(53/255,92/255,125/255,0.85)
        color: Qt.rgba(83/255,116/255,144/255,1)
    }
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: {
            bottom: 10
            left: 10
            right: 10
        }
            StyledButton {
            Layout.topMargin: 60
            width:130
            height:35
            font.pixelSize: 15
            text: "Recipients"
            onClicked: item.state = "recipients"
            }
            StyledButton {
            Layout.topMargin: 20
            id: btn
            width:130
            height:35
            font.pixelSize: 15
            text: "Message"
            onClicked: item.state = "message"
        }
            StyledButton {
            Layout.topMargin: 20
            width:130
            height:35
            font.pixelSize: 15
            text: "SMTP Server"
            onClicked: item.state = "main"
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Component.onCompleted: {
                    console.log(width)
                    console.log(height)
                }
            }
            StatusBlock {

                Layout.alignment: Qt.AlignBottom

            }

}

    NumberAnimation {
        id: animClose
        target: root
        property: "x"
        from: 0
        to: -root.width
        duration: 200
        easing.type: Easing.InOutQuad
    }

    NumberAnimation {
        id: animOpen
        target: root
        property: "x"
        to: 0
        duration: 200
        easing.type: Easing.InOutQuad
    }
}


