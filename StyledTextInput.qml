import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3



TextField {
    width: 150
    height: 25
    font.pixelSize: 12
    Layout.fillWidth: true
    background: Rectangle {
        implicitWidth: 150
        width: 150
        height: 25
        anchors.fill: parent
        radius: 5
        color: "white"
    }

}
