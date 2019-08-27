import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

GridView {
    id: mainGrid

    cellWidth: parent.width / dimenshion
    cellHeight: parent.height / dimenshion

    width: dimenshion * cellWidth
    height: dimenshion * cellHeight

    model: myModel
    delegate: cell

    function createModel() {
        for (var i = 0; i < dimenshion * dimenshion; i++) {
            myModel.append({"display": rndVector[i], "uid": i})
        }
    }

    ListModel {
        id: myModel

        Component.onCompleted: {
            createModel()
        }
    }

    Component {

        id: cell

        Item {
            id: item

            width: mainGrid.cellWidth - 10
            height: mainGrid.cellHeight - 10

            Rectangle {
                id: box
                parent: mainGrid

                x: item.x
                y: item.y + 50

                width: item.width
                height: item.height

                border.width: 1
                property int uid: (index >= 0) ? myModel.get(index).uid : -1

                Text {
                    anchors.centerIn: parent
                    text: display
                    font.pixelSize: 48
                }

                states: [
                    State {
                        name: "active"
                        when: gridArea.activeId == box.uid
                        PropertyChanges {
                            target: box
                            // x: gridArea.mouseX
                            // y: gridArea.mouseY
                            // z: 10
                        }
                    }
                ]
            }
        }
    }

    MouseArea {
        id: gridArea
        anchors.fill: parent
        hoverEnabled: true
        preventStealing : true
        property int index: mainGrid.indexAt(mouseX, mouseY) //item underneath cursor
        property int activeId: -1 //uid of active item
        property int activeIndex //current position of active item

        // onPressAndHold: {
        onPressed: {
            activeId = mainGrid.model.get(activeIndex=index).uid
            console.log(mainGrid.model.modelData)
        }
        onReleased: {
            activeId = -1
        }
        onPositionChanged: {
            if (activeId != -1 && index != -1 && index != activeIndex) {
                mainGrid.model.move(activeIndex, activeIndex = index, 1)
            }
        }
    }
}
