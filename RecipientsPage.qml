import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import "js/func.js" as Utils

Flickable {
    id: flickable
    clip: true
    width: parent.width
    height: parent.height
    contentHeight: parent.height+ 100
    signal sendMail()
    ScrollBar.vertical: ScrollBar {
                parent: flickable.parent
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
            }
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
                            implicitHeight: mainwindow.height - 300
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
                Item {
                    id: spacer
                    height:25
                }
                ColumnLayout {
                    StyledText {
                        text: "Wait between each mail"
                    }

                    Slider {
                    id: control
                    snapMode: Slider.SnapAlways
                    stepSize: 1
                    from: 1
                    to: 4
                    onMoved: {
                        Utils.highlightCurrentSliderValue(value)
                    }
                    Component.onCompleted:
                        Utils.highlightCurrentSliderValue(value)

                    handle: Rectangle {
                        x: control.visualPosition * (control.availableWidth - width)
                        y: control.topPadding + control.availableHeight / 2 - height / 2
                        implicitWidth: 16
                        implicitHeight: 16
                        radius: 10
                        color: "#FF7582"
                        }
                        background: Rectangle {
                                y: control.topPadding + control.availableHeight / 2 - height / 2
                                implicitWidth: 200
                                implicitHeight: 4
                                width: control.availableWidth
                                height: implicitHeight
                                radius: 2
                                color: "#CACACA"




                    }

                    }
                    RowLayout {
                        spacing: 25
                        StyledText {
                            Layout.leftMargin: -5
                            id: option1
                            text: "0.25"

                        }
                        StyledText {
                            id: option2
                            text: "0.50"

                        }
                        StyledText {
                            id: option3
                            text: "0.75"

                        }

                        StyledText {
                            id: option4
                            Layout.leftMargin: 15
                            text: "1"

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
}
