import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    width:130
    height:35
    z: 1
    property alias text: rbutton.text
    property alias font: contItem.font

    RoundButton{
          id: rbutton;
            width: parent.width
            height: parent.height
            text: "Button"
            contentItem: Text {
                id: contItem
                text: parent.text
                font.family: "Inter"
                font.weight: Font.DemiBold
                font.pixelSize : 15
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                id: btn_rect
                width: parent.width
                height: parent.height
                radius:5
                color:"#FF7582"
            }
    }
}
