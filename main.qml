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

    property int margin: 11

    //Rectangle {
    //    color: "#8080ff" // blue
    //    anchors.fill: parent
    //}

    Connections {
        target: AppCore
        onPrintMatrix: {
            gameField.dimenshion = dim
            gameField.rndVector = rndVec
            gameField.createModel()
        }
    }

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent
        anchors.margins: margin

        Rectangle {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: "#ffff80" // yellow
        }

        GameMenu { id: gameModel; Layout.fillWidth: true }

        GameField { id: gameField; Layout.fillWidth: true }

        //onWidthChanged: console.log("mainLayout::width", width)
        //onHeightChanged: console.log("mainLayout::height", height)
    }

    //onWidthChanged: console.log("window::width", width)
    //onHeightChanged: console.log("window::height", height)
}
