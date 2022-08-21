import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.15
import "js/func.js" as Utils


Item {


    id: root
    anchors.fill: parent
    property alias mailHeader: header_input.text
    property alias mailMessage: message_input.text
    property alias attachedFiles: model
    function getAttachedFiles() {
       var files = []
        for(var i = 0; i < model.count; i++) {
            var item = model.get(i)
            files.push(item.modelpath)
        }

        console.log(files)
        return files

    }

    //property alias attached_files: attached_files.text

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
                        ListModel {
                           id: model
                        }

                        ListView {

                            property int prevCount: -1
                            property int hideIndex: 0
                            Layout.fillWidth: true
                            height: 20
                            spacing: 20
                            orientation: ListView.Horizontal
                            model: model
                            id: lv
                            onCountChanged: {
                                if (prevCount >= count){
                                    prevCount = count -1
                                    if(hideIndex > 0){
                                        console.log(lv.hideIndex)
                                console.log("new count: " +count )
                                        if (lv.itemAtIndex(hideIndex-1).x + lv.itemAtIndex(hideIndex-1).width < lv.width) {
                                            model.get(hideIndex-1).sometext = model.get(hideIndex-1).hide
                                        }
                                    }
                                }

                            }

                            delegate:
                        StyledText {
                            property string hide
                            horizontalAlignment: Qt.AlignTop
                            id: outer
                            text: viewpath
                                 Text {
                                     id: icon
                                     visible: outer.text == "..." ? false : true
                                     anchors.left: outer.right
                                     font.family: fasolid.name
                                     text: "\uf1f8"
                                     font.pixelSize: 14
                                     color:"#FF7582"
                                     MouseArea {
                                         anchors.fill: icon
                                         onClicked: delete_item(index)
                                     }
                                 }
                        }
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

        function delete_item(index){
            model.remove(index)
        }


        FileDialog {
            id: fd
            onAccepted: {
                //attached_files.text += Utils.getViewFileName(fd.fileUrl) + " "
                model.append({"viewpath": Utils.getViewFileName(fd.fileUrl), "modelpath":Utils.getModelFileName(fd.fileUrl)})
                lv.forceLayout()
                    lv.prevCount +=1
                console.log(lv.count)
                const newitem = lv.itemAtIndex(lv.count - 1)
                console.log(item.x)
                if((newitem.x + newitem.width) > lv.width- 50){
                model.remove(lv.count -1)
                model.append({"viewpath": "...","hide":Utils.getViewFileName(fd.fileUrl),"modelpath":Utils.getViewFileName(fd.fileUrl)})
                lv.hideIndex = lv.count - 1
                    getAttachedFiles()
                    return;
                }

            }

        }
}


