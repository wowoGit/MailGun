import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import "js/func.js" as Utils

Item {
    id: root
    anchors.fill: parent
    property alias recipients: listview_recipients.lview
    signal sendMail()

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

                Connections {
                    target: app
                    onRecipientsChanged: {
                        listview_recipients.lview.model = app.recipients
                        counter.text = listview_recipients.lview.count

                    }
                }


                RowLayout {
                    Text {
                        Layout.fillWidth: true
                        id: header
                        text: "Set up your recipients"
                        font.family: "Inter"
                        font.weight: Font.DemiBold
                        font.pixelSize: 22
                        color: "white"
                    }
                }
                ColumnLayout {
                    Layout.topMargin: 55
                    RowLayout {
                    spacing: 10
                    ColumnLayout {
                    StyledText {
                        text: "Path to the file"
                    }
                        RowLayout {

                    StyledTextInput {
                        id:filepath

                    }
                    StyledButton {
                        Layout.alignment: Qt.AlignBottom
                        width: 100
                        text: "Choose a file..."
                        onClicked: fd.open()
                    }
                        }
                    StyledListView {
                            id: listview_recipients
                            Layout.fillWidth: true
                            implicitHeight: root.height - 300
                    }
                        RowLayout {
                            StyledText {
                                text: "Total recipients: "
                            }
                            StyledText {
                                id:counter
                                text: "0"
                            }
                            Item {
                                Layout.fillWidth: true
                            }
                            StyledButton {
                                id: send_button
                                text: "Send mail"
                                onClicked: sendMail()
                            }
                        }
                    }


                }

                }
}
}
                    FileDialog {
                        id: fd
                        onAccepted: {
                            var file = fd.fileUrl
                            filepath.text = Utils.getViewFileName(file);
                            app.file_submitted(Utils.getModelFileName(file));

                        }
                    }

}
