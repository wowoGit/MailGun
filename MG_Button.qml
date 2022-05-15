import QtQuick 2.5
import QtQuick.Controls 2.5

Item {
        height: 25
        width: 90
        property alias button: rbutton
        property alias button_cont: contItem
        property alias button_rect: btn_rect
        property alias fg_color: contItem.color
        property alias bg_color: btn_rect.color
        RoundButton {
            id: rbutton;
            width: parent.width
            height: parent.height
            text: "Choose File..."
            contentItem: Text {
                id: contItem
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                id: btn_rect
                width: parent.width
                height: parent.height
                border.width: 1
                radius:5
            }
        }
}
