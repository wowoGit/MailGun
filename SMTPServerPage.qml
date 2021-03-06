import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
Item {
    anchors.fill: parent
    property alias host: host_input.text
    property alias port: port_input.text
    property alias login: login_input.text
    property alias password: password_input.text
    signal connect()
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
                        text: "Set up SMTP connection"
                        font.family: "Inter"
                        font.weight: Font.DemiBold
                        font.pixelSize: 22
                        color: "white"
                    }
                }
                RowLayout {
                    spacing: 26
                    Layout.topMargin: 55
                    ColumnLayout {
                        Text {
                            id: hostText
                            text: "Host"
                            font.family: "Inter"
                            font.weight: Font.DemiBold
                            font.pixelSize: 12
                            color:"#CACACA"
                        }
                        StyledTextInput {
                            id: host_input
                            text: "smtp.gmail.com"

                        }
                    }
                    ColumnLayout {
                        Text {
                            id: portText
                            text: "Port"
                            font.family: "Inter"
                            font.weight: Font.DemiBold
                            font.pixelSize: 12
                            color:"#CACACA"
                        }
                        StyledTextInput {
                            id: port_input
                            text: "465"

                        }
                    }

                }
                RowLayout {
                    spacing: 26
                    ColumnLayout {
                        Text {
                            id: loginText
                            text: "Login"
                            font.family: "Inter"
                            font.weight: Font.DemiBold
                            font.pixelSize: 12
                            color:"#CACACA"
                        }
                        StyledTextInput {
                            id: login_input
                            text: "RussianAggression2022@gmail.com"

                        }
                    }
                    ColumnLayout {
                        Text {
                            id: passwordText
                            text: "Password"
                            font.family: "Inter"
                            font.weight: Font.DemiBold
                            font.pixelSize: 12
                            color:"#CACACA"
                        }
                        StyledTextInput {
                            id: password_input
                            text: "xfunlqkfscqfgjnv"
                        }
                    }

                }
                RowLayout{
                      Layout.alignment: Qt.AlignRight
                      Layout.topMargin: 10
                   StyledButton {
                       id: connect_button
                       text: "Connect"
                       onClicked: connect()
                   }

                }

            }
        }
//        Popup {
//            contentItem:
//                Text {
//                    text: "asd"
//                }
//            id: popup
//                    x: 100
//                    y: 100
//                    width: 200
//                    height: 300
//                    modal: true
//                    focus: true
//                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
//            Component.onCompleted: popup.open()

//            enter: Transition {
//                NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
//            }
//        }
    }

