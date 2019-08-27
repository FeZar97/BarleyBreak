import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    id: settingsPanel
    height: 40

    Label {
        id: dimenshionTXT
        text: qsTr("Field dimenshion:")
    }

    SpinBox {
        id: dimenshionSB
        from: 2
        to: 9
        value: 3
    }

    Button {
        id: startButton
        text: qsTr("Start game")
        onClicked: AppCore.fillMatrix(dimenshionSB.value)
    }
}
