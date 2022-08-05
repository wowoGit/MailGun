import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


ApplicationWindow
{

    width: 700
    height: 500
    visible: true
    id: mainwindow
    readonly property int defMargin: 10
    readonly property color bgColor: "#52b788"
    readonly property color fontColor: "black"
    readonly property color ctrlColor: "#2d6a4f"
    readonly property color fieldColor: "#d8f3dc"
    readonly property color eventColor: "#AEFEFF"

    Item {
        id: item
        anchors {
            left: sidebar.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        Component.onCompleted: item.state = "main"
    states: [
        State {
            name: "main"
            PropertyChanges {
                target: smtp_page; visible: true
            }
            PropertyChanges {
                target: message_page; visible: false

            }
            PropertyChanges {
                target: recipients_page; visible: false

            }
            },
        State{
            name: "message"
            PropertyChanges {
                target: message_page; visible: true
        }
            PropertyChanges {
                target: smtp_page; visible: false

            }
            PropertyChanges {
                target: recipients_page; visible: false

            }

    },
        State{
            name: "recipients"
            PropertyChanges {
                target: message_page; visible: false
        }
            PropertyChanges {
                target: smtp_page; visible: false

            }
            PropertyChanges {
                target: recipients_page; visible: true

            }

    }
    ]
    SMTPServerPage {
        id: smtp_page
        onConnect: app.connectToServer(smtp_page.host,smtp_page.port, smtp_page.login, smtp_page.password)
        Connections {
            target: app
            function onConnectionResult(status)
            {
                console.log(status)
                smtp_page.conStatus = status
            }
        }
    }
    MessagePage {id: message_page}
    RecipientsPage {
        id: recipients_page
        onSendMail: {
            app.sendAll(message_page.mailHeader, message_page.mailMessage,message_page.attached_files)
        }
    }
    }

    FontLoader {
       id: faregular
       source: './font/fa-regular.otf'
    }

    SideBar {
        id: sidebar
    }
            SideBarCloseButton {
            id: sidebar_btn
            Layout.topMargin: 5
            area.onClicked: {
                if (sidebar.x == - sidebar.width){
                    sidebar.animOpen.start();
                    sidebar_btn.slideOpen.start();
                    sidebar_btn.rotateclose.start();
                }
                else{
                    sidebar.animClose.start();
                    sidebar_btn.slideClose.start();
                    sidebar_btn.rotateopen.start();
                }
            }
            }
//    Loader {
//        id: mainloader
//        anchors {
//            left: sidebar.right
//            right: parent.right
//            top: parent.top
//            bottom: parent.bottom
//        }
//        source: "MessagePage.qml"
//    }


    }
