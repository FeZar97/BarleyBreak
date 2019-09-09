import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    title: qsTr("BarleyBreak")
    width: Screen.width / 2
    height: Screen.height / 1.8

    property var winWinow: WinWindow {}

    Connections {
        target: AppCore

        onShowWinWindow: {
            winWinow.visible = true
        }
    }

    ColumnLayout {
        anchors.fill: parent

        GameMenu { id: menu ; onButtonClicked: field.createRandomField(menu.dimenshion)}

        GameField { id: field }

        focus: true
        Keys.onPressed: {
            if (event.key === Qt.Key_Up)       AppCore.upPressed()
            if (event.key === Qt.Key_Down)     AppCore.downPressed()
            if (event.key === Qt.Key_Right)    AppCore.rightPressed()
            if (event.key === Qt.Key_Left)     AppCore.leftPressed()
        }
    }

    Component.onCompleted: field.createRandomField(menu.dimenshion) //AppCore.fillMatrix(menu.dimenshion)
}
