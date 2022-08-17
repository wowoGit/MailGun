import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3



TextField {
    id: root
    width: 150
    height: 25
    font.pixelSize: 12
    Layout.fillWidth: true
    selectByMouse: true
    selectionColor: "steelblue"
    background: Rectangle {
        implicitWidth: root.width
        width: 150
        height: 25
        anchors.fill: parent
        radius: 5
        color: "white"
    }

}
