import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtWinExtras 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("BarleyBreak")

    property int dimenshion: 2

    Connections {

        target: AppCore
        onPrintMatrix: {
            dimenshion = dim
            //grid.model = rndVector
            // grid.forceLayout()

            console.log(grid.model)
        }
    }

    Component {
        id: header

        RowLayout {
            id: settingsPanel

            Label {
                id: dimenshionTXT
                text: qsTr("Field dimenshion:")
            }

            SpinBox {
                id: dimenshionSB
                from: 2
                to:   9
                value: dimenshion
            }

            Button {
                id: startButton
                text: qsTr("Start game")
                onClicked: AppCore.fillMatrix(dimenshionSB.value)
            }
        }
    }

    ListModel {
        id: myModel
        ListElement { name: "Music"}
        ListElement { name: "Movies"}
        ListElement { name: "Camera"}
        ListElement { name: "Calendar"}
        ListElement { name: "Messaging"}
        ListElement { name: "Todo List"}
        ListElement { name: "Contacts"}
    }

    GridView {
        id: grid
        anchors.fill: parent

        cellWidth: parent.width / dimenshion - 40
        cellHeight: parent.height / dimenshion - 40

        focus: true

        header: header

        model: myModel

        delegate: Item {
            Rectangle {
                id: rect
                width: grid.cellWidth - 10; height: grid.cellHeight - 10
                color: "lightgreen"
                border.color: "green"
                border.width: 3
                radius: 10

                Text {
                    text: name
                    anchors.centerIn: rect
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        //parent.GridView.view.currentIndex = index
                        parent.color = (parent.color == "red" ? "green" : "red")
                        console.log(name)
                    }
                }
            }
        }
    }

    onWidthChanged: {
        width = Math.max(width, height)
        height = Math.max(width, height)
    }

    onHeightChanged: {
        width = Math.max(width, height)
        height = Math.max(width, height)
    }
}
