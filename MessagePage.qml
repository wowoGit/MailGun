import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import "js/func.js" as Utils

Item {
    id: root
    anchors.fill: parent
    property alias mailHeader: header_input.text
    property alias mailMessage: message_input.text
    property alias attached_files: attached_files.text

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
                        text: "Set up a message"
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
                        StyledTextInput {
                            id: header_input
                        }
                        }
                        }




                    RowLayout {
                ColumnLayout {
                        StyledText {
                            text: "Mail Message"
                            font.pixelSize: 14
                        }
                        StyledTextArea {
                            id: message_input
                            implicitWidth: 200
                            implicitHeight: root.height - 300
                        }
                        }
                    }


                    RowLayout {
                        Layout.alignment: Qt.AlignRight
                        StyledText {
                            id: attached_files;
                        }
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
            onAccepted: attached_files.text += Utils.getModelFileName(fd.fileUrl)

        }
}
