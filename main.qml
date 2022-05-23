import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.3


Window {

    width: 300
    height: 250
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
        anchors.topMargin: 10
        gradient: Gradient {
                GradientStop {position: -10; color: mainwindow.ctrlColor; }
                GradientStop {position: 0.33; color: mainwindow.bgColor; }
                GradientStop {position: 1.0; color: mainwindow.fieldColor; }
            }

    GridLayout {
        anchors.fill: parent
        rows: 3
        columns: 3
        FileDialog {
            id: fd
            folder: shortcuts.desktop
            onAccepted: {

            }
        }
        ColumnLayout {
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            RowLayout{
        MG_TextInput {
            Layout.fillWidth: true
            Layout.columnSpan: 2
            id: ti
            text: "Path to emails file..."
            color: mainwindow.fieldColor
        }
        MG_Button {
            id: btn
            bg_color: mainwindow.ctrlColor
            fg_color: mainwindow.fontColor
            button_rect.border.color: button.hovered ? mainwindow.eventColor : mainwindow.fontColor
            button.onClicked: {
                fd.open()
            }
           }
        }

//        MG_TextArea{
//            id: txt_area
//            Layout.columnSpan: 2
//            Layout.fillWidth: true
//            width: 100
//            height:200
//            rect.color: mainwindow.fieldColor
//            }

            MG_LIstView {
                rect.color: mainwindow.fieldColor
                Layout.columnSpan: 2
                Layout.fillWidth: true
                width: 100
                clip: true
                height:200
                lview.model: app.recipients
            }

        }

        }
}

    }
