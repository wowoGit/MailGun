import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12
import Status 1.0
Item {

        function open(status){
            visible = true;
            switch(status) {
            case Status.CONNECTION_SUCCESS: // CONNECTION_SUCCESS
                state = "success"
                break
            case Status.CONNECTION_FAIL: // CONNECTION_FAIL
                state = "failure"
                break
            case Status.LOGIN_FAIL: // LOGIN_FAIL
                state = "login_failure"
                break
            }

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
            },
            State {
                name: "login_failure"
                PropertyChanges {
                    target: text
                    text: "Failed to login"
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
