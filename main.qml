import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.3


Window {

    width: 700
    height: 500
    visible: true
    title: qsTr("Hello World")
    id: mainwindow
    color: bgColor
    readonly property int defMargin: 10
    readonly property color bgColor: "#52b788"
    readonly property color fontColor: "black"
    readonly property color ctrlColor: "#2d6a4f"
    readonly property color fieldColor: "#d8f3dc"
    readonly property color eventColor: "#AEFEFF"
    Connections {
        target: app
        onProcess_emails: {
            txt_area.area.text = emails_list;

        }
    }

    Connections {
        target: fd
        onAccepted: {
                var path = fd.fileUrl.toString();
                var path_model = path.replace("file:///","");
                var path_view = path.split('/').pop();
                ti.text = path_view;
                app.file_submitted(path_model);
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#ffffff"
   }
    SideBar {
        id: sidebar
    }

    Loader {
        anchors {
            left: sidebar.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        source: "StackViewPage.qml"
    }


    }
