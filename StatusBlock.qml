import QtQuick 2.15
import QtQuick.Layouts 1.3
import Status 1.0

Item {
    Layout.fillHeight: true
    Layout.fillWidth: true
    ColumnLayout {
        anchors.bottom: parent.bottom
        RowLayout {
        StyledText {
            text: "SMTP:"

        }
        StyledText {
            text: "Disconnected"
            id: status_text
            color: "#E53935"
            font.pixelSize: 13
            Connections {
                target: app
                function onConnectionResult(conStatus) {
                    switch(conStatus) {
                    case Status.CONNECTION_SUCCESS:
                        status_text.text = "Connected"
                        status_text.color = Qt.lighter("#4bb543")
                        status_text.font.pixelSize = 14
                        break

                    case Status.CONNECTION_FAIL:
                        status_text.text = "Disconnected"
                        status_text.color= "#E53935"
                        status_text.font.pixelSize = 13
                        break
                    }

                }
            }

        }
        }

        RowLayout {
            StyledText {
                text: "Proxy:"
            }
            StyledText {
                text: "Disabled"
                color: "#E53935"
            }
        }

        RowLayout {
            StyledText {
                text: "Mails sent:"
                color: Qt.lighter("#4bb543")
            }
            StyledText {
                id: success_mails
                text: "0"
            }
        }
            RowLayout{
            StyledText {
                text: "Mails failed:"
                color: "#E53935"
            }
            StyledText {
                id: failed_mails
                text: "0"
            }
            }

        }

            Connections {
                target: app
                function onMailsSent(rcptSize, mailStatus) {
                    switch(mailStatus) {
                    case Status.SEND_SUCCESS:
                        var val =
                        success_mails.text = parseInt(success_mails.text) + rcptSize
                        break

                    case Status.SEND_ERROR:
                        failed_mails.text = parseInt(failed_mails.text) + rcptSize
                        break
                    }

                }
            }
    }


