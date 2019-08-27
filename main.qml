import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("BarleyBreak")

    property int dimenshion: 3
    property var rndVector: [1,2,3,4,5,6,7,8,9]

    Connections {
        target: AppCore
        onPrintMatrix: {
            dimenshion = dim
            rndVector = rndVec
            GameField.createModel()
        }
    }

    GameMenu {}

    GameField {}
}
