import QtQuick 2.0
import QtQuick.Window 2.13
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: winWindow
    visible: false
    width: window.width
    height: window.height
    transientParent: parent
    title: qsTr("Congratulations!")
    modality: Qt.WindowModal
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: "lightgreen"

        ColumnLayout {
            anchors.fill: parent
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                text: qsTr("You win!")
                anchors.centerIn: parent
                font.pixelSize: 50
            }

            Row {
                Button {
                    text: qsTr("New game")
                }
                Button {
                    text: qsTr("Exit")
                }
            }
        }
    }
}
