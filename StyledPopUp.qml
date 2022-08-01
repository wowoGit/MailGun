import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12
Item {

        function open(){
            visible = true;
            root.open();
        }
        states: [
            State {
                name: "success"
                PropertyChanges {
                    target: text
                    text: "Connected"
                    color: Qt.lighter("#4bb543")


                }
            },
            State {
                name: "failure"
                PropertyChanges {
                    target: text
                    text: "Failure"
                    color: Qt.lighter("#E53935")


                }
            }
        ]
        Popup {
        id: root
        x: smtp_page.width / 2 - root.width / 2
        y: smtp_page.height - 100
        width: 125
        height: 40
            contentItem:
                StyledText {
                horizontalAlignment: Qt.AlignHCenter
                    anchors.centerIn: parent
                    id: text
                    text: "Connected"
                    color: Qt.lighter("#4bb543")
                }
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
            background:Item {
                anchors.fill: root
                RectangularGlow {
                    id: effect
                    anchors.fill: rect
                    glowRadius: 5
                    spread: 0.1
                    color: text.color
                    cornerRadius: rect.radius + glowRadius
                }
                Rectangle {
                    anchors.fill: parent
                id: rect
                border.width: 1
                border.color: text.color
                radius: 5
                color: "#365C7D"
            }
            }


            enter: Transition {
                NumberAnimation { property: "y";
                    from: parent.height;
                    to: parent.height - root.height-10
                    easing.type: Easing.OutCirc
                }

            }
            exit: Transition {
                NumberAnimation { property: "y";
                    from: root.y;
                    to: parent.height
                }

            }


        }
}
