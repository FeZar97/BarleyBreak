import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    title: qsTr("BarleyBreak")
    width: 640
    height: 480

    Connections {
        target: AppCore
        onPrintMatrix: {
            gameField.dimenshion = dim
            gameField.rndVector = rndVec
            gameField.appendModel()
        }
    }

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent

        Rectangle {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: "#ffff80" // yellow
        }

        GameMenu { id: gameMenu; Layout.fillWidth: true }

        GameField { id: gameField; Layout.fillWidth: true }

        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Up) AppCore.upPressed()
            if (event.key == Qt.Key_Down) AppCore.downPressed()
            if (event.key == Qt.Key_Right) AppCore.rightPressed()
            if (event.key == Qt.Key_Left) AppCore.leftPressed()
        }
    }

    Component.onCompleted: AppCore.fillMatrix(gameMenu.dimenshion)
}
