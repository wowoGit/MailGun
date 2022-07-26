import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id: root
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "#365C7D"
    }


        RowLayout {
        Layout.alignment: Qt.AlignTop
        anchors.fill: parent
            ColumnLayout {
            Layout.alignment: Qt.AlignTop
                Layout.leftMargin: 55
                Layout.topMargin: 25
                Layout.rightMargin: 55



                RowLayout {
                    Text {
                        Layout.fillWidth: true
                        id: header
                        text: "Setup a message"
                        font.family: "Inter"
                        font.weight: Font.DemiBold
                        font.pixelSize: 22
                        color: "white"
                    }
                }



                RowLayout {
                    Layout.topMargin: 55
                ColumnLayout {
                    spacing: 15



                    RowLayout {
                        ColumnLayout {
                        StyledText {
                            text: "Mail Header"
                            font.pixelSize: 14
                        }
                        StyledTextInput {}
                        }
                        }




                    RowLayout {
                ColumnLayout {
                        StyledText {
                            text: "Mail Message"
                            font.pixelSize: 14
                        }
                        StyledTextArea {
                            implicitWidth: 200
                            implicitHeight: root.height - 300
                        }
                        }
                    }


                    RowLayout {
                        Layout.alignment: Qt.AlignRight
                        ColumnLayout {
                            StyledButton {
                            width: 100
                            text: "Attach files..."
                            onClicked: fd.open()
                            }
                        }
                    }
                    }
                }
}
}



        FileDialog {
            id: fd

        }
}
