import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: root;
    width: 150;
    anchors {
        left: parent.left
        bottom:parent.bottom
        top: parent.top
    }
    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(53/255,92/255,125/255,0.85)
    }
    RowLayout {
    ColumnLayout {
    Layout.leftMargin: 10
        RowLayout {
            SideBarCloseButton {
            Layout.topMargin: 5
            }
        }
        RowLayout {
            Layout.topMargin: 20
            SideBarButton {
            text: "Message"
            }
        }
        RowLayout {
            Layout.topMargin: 20
            SideBarButton {
            text: "SMTP Server"
            }
        }
    }
}
}
