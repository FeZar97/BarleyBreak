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

    ColumnLayout {
        anchors.fill: parent

        GameMenu {
            id: menu;
            onButtonClicked: field.createRandomField(menu.dimenshion)
        }

        GameField {
            id: field
            onWin: winWinow.visible = true
        }

        focus: true
        Keys.onPressed: {
            if (event.key === Qt.Key_Up)    field.upPressed()
            if (event.key === Qt.Key_Down)  field.downPressed()
            if (event.key === Qt.Key_Right) field.rightPressed()
            if (event.key === Qt.Key_Left)  field.leftPressed()
        }
    }

    Component.onCompleted: field.createRandomField(menu.dimenshion)
}
