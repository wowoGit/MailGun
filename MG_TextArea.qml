import QtQuick 2.0
import QtQuick.Controls 2.15

Item {

   property alias rect:  rect
   property alias area:  ta
    Rectangle
    {
    id: rect
    anchors.fill: parent
    color: "white"
    border.width: 1
    radius: 5;
    Flickable {
    id:flickable
    anchors.fill: parent
    boundsBehavior: Flickable.StopAtBounds
    TextArea.flickable: TextArea {
        id: ta
        anchors.fill: rect
        wrapMode: TextArea.Wrap
        readOnly: true
    }

    ScrollBar.vertical: ScrollBar {}
    }
    }
}
