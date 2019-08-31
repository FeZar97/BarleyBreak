import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    id: mainLayout
    Layout.fillWidth: true
    Layout.margins: 15

    property var dimenshion: dimenshionSB.value

    Label {
        id: dimenshionTXT
        text: qsTr("Field dimenshion:")
    }

    SpinBox {
        id: dimenshionSB
        Layout.fillWidth: true
        from: 2; to: 9
        value: 3
    }

    Button {
        id: startButton
        text: qsTr("Test")
        onClicked: AppCore.fillMatrix(dimenshionSB.value)
    }
}
