import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12

Item {
    id: root
    width:76
    height:24
    property alias text: rbutton.text
    property alias font: rbutton.font
    signal clicked()
    RoundButton{
          id: rbutton;
          anchors.fill: root
            text: "Button"
            contentItem: Text {
                id: contItem
                text: parent.text
                font.family: "Inter"
                font.weight: Font.DemiBold
                font.pixelSize : 12
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
            onClicked: {root.clicked()}
            hoverEnabled: true
            onHoveredChanged: {
                if(hovered) {
                shadow.visible = true;
                mousearea.cursorShape = Qt.PointingHandCursor;
                }
                else {
                shadow.visible = false;
                mousearea.cursorShape = Qt.ArrowCursor;
                }
    }
    }
    DropShadow {
        id: shadow
        visible: false
        anchors.fill: rbutton
                radius: 8.0
                samples: 17
                color: "#FF5060"
                source: rbutton
    }
    MouseArea {
        id: mousearea
        onClicked: root.clicked()
        anchors.fill: rbutton
    }
}
