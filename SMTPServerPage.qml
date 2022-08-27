import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import Status 1.0
Item {
    id: root
    anchors.fill: parent
    property alias host: host_input.text
    property alias port: port_input.text
    property alias login: login_input.text
    property alias password: password_input.text
    property int conStatus: -1
    signal connect()
    onConStatusChanged: {
        console.log("hello")
        popup.open(conStatus)
    }
    Rectangle {
        anchors.fill: parent
        color: "#365C7D"
    }

        ColumnLayout {
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
                            implicitWidth: 150
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
                            implicitWidth: 150
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
                            implicitWidth: 150
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
                            implicitWidth: 150
                            id: password_input
                            echoMode: TextInput.Password
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
                       onClicked: {
                           connect()
                          //popup.state = "failure";
                          //popup.open();
                       }
                   }

                }



                RowLayout {

                    Rectangle {
                        Layout.fillWidth: true
                        color: "red"
                    }

            ColumnLayout {
                Layout.topMargin: 50
                RowLayout {

                    CheckBox {
                        id:control
                        text: "Use proxy"
                        indicator: Rectangle {
                            id: outer
                               implicitWidth: 16
                               implicitHeight: 16
                               y: parent.height / 2 - height / 2
                               radius: 3
                               border.color: control.checked ? Qt.lighter("#4bb543") : "#CACACA"

                               Rectangle {
                                   anchors.centerIn : outer
                                   width: 10
                                   height: 10
                                   radius: 2
                                   color: control.checked ? Qt.lighter("#4bb543") : "#CACACA"
                                   visible: control.checked
                               }
                           }

                           contentItem: StyledText {
                               text: control.text
                               opacity: enabled ? 1.0 : 0.3
                               color: control.down ? Qt.lighter("#4bb543") : "#CACACA"
                               verticalAlignment: Text.AlignVCenter
                               leftPadding: control.indicator.width + control.spacing
                           }
                    }
                }
                RowLayout {

                    ColumnLayout {
                        Text {
                            enabled: control.checked
                            text: "IP address"
                            font.family: "Inter"
                            font.weight: Font.DemiBold
                            font.pixelSize: 12
                            color:"#CACACA"
                        }
                        StyledTextInput {
                            implicitWidth: 250
                            enabled: control.checked
                            //inputMask: "000.000.000.000;_"
                            validator:RegExpValidator
                            {
                              regExp:/^(([01]?[0-9]?[0-9]|2([0-4][0-9]|5[0-5]))\.){3}([01]?[0-9]?[0-9]|2([0-4][0-9]|5[0-5]))$/
                            }

                        }
                    }
                    ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter
                        Text {
                            enabled: control.checked
                            text: "Port"
                            font.family: "Inter"
                            font.weight: Font.DemiBold
                            font.pixelSize: 12
                            color:"#CACACA"
                        }
                        StyledTextInput {
                            implicitWidth: 100
                            validator: IntValidator {bottom: 1; top: 10000}
                            enabled: control.checked
                        }
                    }
                }
            }
                    Rectangle {
                        Layout.fillWidth: true
                        color: "red"
                    }
                }
                }

            StyledPopUp {
                id: popup

            }
        }
    }

