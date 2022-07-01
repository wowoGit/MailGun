import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

Item {
    anchors.fill: parent
    StackView {
        id:stackview
        anchors.fill: parent
        initialItem: "SMTPServerPage.qml"
    }

}
