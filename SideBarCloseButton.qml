import QtQuick 2.0
import QtQuick.Layouts 1.3


ColumnLayout{
    Layout.topMargin: 5
Repeater {
   model: 3
    Rectangle {
        width:30
        height:7
        anchors.margins: {
            top: 2
        }
        color: Qt.rgba(255,117/255,130/255,0.5)
        radius: 5
    }
}
}
