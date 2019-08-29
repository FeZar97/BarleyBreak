import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    id: settingsPanel
    //anchors.fill: parent

    //Rectangle {
    //    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    //    color: "#ff8282" // lightred
    //}

    Label {
        id: dimenshionTXT
        text: qsTr("Field dimenshion:")
    }

    SpinBox {
        id: dimenshionSB
        from: 2
        to: 9
        value: 3
        Layout.fillWidth: true
    }

    Button {
        id: startButton
        text: qsTr("Test")
        onClicked: AppCore.fillMatrix(dimenshionSB.value)
    }
}
