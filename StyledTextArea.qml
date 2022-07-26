import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
    Layout.fillWidth: true
     Rectangle {
         id:rect
        anchors.fill: parent
        radius: 5
        color: "white"
    Flickable {
    id:flickable
    contentWidth: ta.width
    contentHeight: ta.height
    anchors.fill: parent
    boundsBehavior: Flickable.StopAtBounds
    TextArea.flickable: TextArea {
        font.pixelSize: 14
        id: ta
        selectByMouse: true
        anchors.fill: rect
        wrapMode: TextArea.Wrap
        selectionColor: "steelblue"
        selectedTextColor: "#eee"
    }

    ScrollBar.vertical: ScrollBar {}
    }
    }

}
