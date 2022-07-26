import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    property alias slideOpen: slideopen
    property alias slideClose: slideclose
    property alias rotateopen: rotateopen
    property alias rotateclose: rotateclose
    id: root
    height: 40
    x:120
    y:5
    z:2
    width:25
    property alias area: area
ColumnLayout{
    Layout.topMargin: 5
    Text {
        id:icon
        anchors.fill: root
        font.family: faregular.name
        text: "\uf0d9"
        transformOrigin: Item.Center
        font.pixelSize: 45
        color:"#FF7582"

    }

//Repeater {
//   model: 3
//    Rectangle {
//        width:25
//        height:5
//        color: "#FF7582"
//        radius: 5
//    }
//}
}
MouseArea
{
   id: area
   anchors.fill: root
}

NumberAnimation {
    id: slideclose
    target: root
    property: "x"
    to:10
    duration: 200
    easing.type: Easing.InOutQuad
}
NumberAnimation {
    id: slideopen
    target: root
    to:115
    property: "x"
    duration: 200
    easing.type: Easing.InOutQuad
}
RotationAnimation {
    id:rotateopen
    target: icon
    properties: "rotation"
    to:180
}
RotationAnimation {
    id:rotateclose
    target: icon
    properties: "rotation"
    to:0
}
}
