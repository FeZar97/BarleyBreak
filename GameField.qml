import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    id: parentItem
    //anchors.fill: parent

    //Rectangle {
    //    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    //    color: "lightgreen"
    //}

    function createModel() {
        console.log("createModel(): ")
        // for (var i = 0; i < dimenshion * dimenshion; i++) {
        //     myModel.append({"display": rndVector[i], "uid": i})
        //     console.log("createModel(): ", myModel.modelData)
        // }
    }

    ColumnLayout {
        Layout.fillWidth: true
        Repeater {
            id: rowRepeater
            model: dimenshion

            RowLayout {
                Layout.fillWidth: true

                Rectangle {
                    id: rect

                    width: parent.width - 4
                    height: parent.height - 4

                    color: "#80ff80"
                    border.color: "red"
                    border.width: 2

                    Text {
                        anchors.centerIn: parent
                        text: index
                    }
                }

                //Repeater {
                //    model: dimenshion
                //
                //    Cell {
                //        width: parentItem.width/dimenshion
                //        height: parentItem.height/dimenshion
                //    }
                //}
            }
        }
        onHeightChanged: console.log("gameField::height", height)
    }

    onWidthChanged: console.log("mainGameField::width", width)

/*
    // id: parentItem
    //
    // ListModel {
    //     id: myModel
    //
    //     Component.onCompleted: {
    //         createModel()
    //     }
    // }
    //
    // function createModel() {
    //     for (var i = 0; i < dimenshion * dimenshion; i++) {
    //         myModel.append({"display": rndVector[i], "uid": i})
    //         console.log("createModel(): ", myModel.modelData)
    //     }
    // }
    //
    // GridView {
    //     id: mainGrid
    //
    //     cellWidth: parent.width / dimenshion
    //     cellHeight: parent.height / dimenshion
    //
    //     width: dimenshion * cellWidth
    //     height: dimenshion * cellHeight
    //
    //     model: myModel
    //     delegate: cell
    //
    //     Component {
    //         id: cell
    //
    //         Rectangle {
    //             id: box
    //             parent: mainGrid
    //
    //             color: "yellow"
    //
    //             property int uid: (index >= 0) ? myModel.get(index).uid : -1
    //
    //             x: box.x
    //             y: box.y
    //
    //             width: mainGrid.cellWidth - 10
    //             height: mainGrid.cellHeight - 10
    //
    //             border.width: 1
    //
    //             Text {
    //                 anchors.centerIn: parent
    //                 text: display
    //                 font.pixelSize: 40
    //             }
    //
    //             MouseArea {
    //                 id: cellArea
    //
    //                 anchors.fill: box
    //                 hoverEnabled: true
    //                 preventStealing : true
    //                 property int index: mainGrid.indexAt(mouseX, mouseY) //item underneath cursor
    //                 property int activeId: -1 //uid of active item
    //                 property int activeIndex //current position of active item
    //
    //                 // onPressAndHold: {
    //                 onPressed: {
    //                     activeId = mainGrid.model.get(activeIndex=index).uid
    //                     console.log(activeId)
    //                 }
    //                 onReleased: {
    //                     activeId = -1
    //                 }
    //                 onPositionChanged: {
    //                     if (activeId != -1 && index != -1 && index != activeIndex) {
    //                         mainGrid.model.move(activeIndex, activeIndex = index, 1)
    //                     }
    //                 }
    //             }
    //
    //             // states: [
    //             //     State {
    //             //         name: "active"
    //             //         when: gridArea.activeId == box.uid
    //             //         PropertyChanges {
    //             //             target: box
    //             //             // x: gridArea.mouseX
    //             //             // y: gridArea.mouseY
    //             //             // z: 10
    //             //         }
    //             //     }
    //             // ]
    //         }
    //     }
    // }
*/
}