import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Item {
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
                        text: "Setup SMTP connection"
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
                        TextField {
                            width: 150
                            height: 25
                            Layout.fillWidth: true
                            background: Rectangle {
                                implicitWidth: 150
                                width: 150
                                height: 25
                                anchors.fill: parent
                                radius: 5
                                color: "white"
                            }

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
                        TextField {
                            Layout.fillWidth: true
                            width: 150
                            height: 25
                            background: Rectangle {
                                implicitWidth: 150
                                width: 150
                                height: 25
                                anchors.fill: parent
                                radius: 5
                                color: "white"
                            }

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
                        TextField {
                            Layout.fillWidth: true
                            background: Rectangle {
                                implicitWidth: 150
                                height: 25
                                anchors.fill: parent
                                radius: 5
                                color: "white"
                            }

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
                        TextField {
                            Layout.fillWidth: true
                            background: Rectangle {
                                implicitWidth: 150
                                height: 25
                                anchors.fill: parent
                                radius: 5
                                color: "white"
                            }

                        }
                    }

                }
                RowLayout{
                      Layout.alignment: Qt.AlignRight
                      Layout.topMargin: 10
                   StyledButton {
                       text: "Connect"
                   }

                }

            }
        }
    }

