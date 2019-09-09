import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    id: mainLayout
    Layout.fillWidth: true
    Layout.margins: 15

    property var dimenshion: 3
    property var trueVector: [1,2,3,4,5,6,7,8,-1]

    function isContained(list, value) {
        for(var i = 0; i < list.length; i++)
            if(list[i] === value)
                return true
        return false
    }

    function findCellIdx(model, value) {
        for(var i = 0; i < model.count; i++) {
            if(model.get(i).display - value === 0.) {
                return i
            }
        }
        return -1
    }

    function swapWithNull(display) {

        var cellIdx = findCellIdx(myModel, display)

        // if null cell is on left side
        if((cellIdx) % dimenshion > 0) {
            if(myModel.get(cellIdx - 1).display === -1) {
                myModel.move(cellIdx, cellIdx - 1, 1)
            }
        }

        // if null cell is on right side
        if((cellIdx + 1) % dimenshion > 0) {
            if(myModel.get(cellIdx + 1).display === -1) {
                myModel.move(cellIdx, cellIdx + 1, 1)
            }
        }

        // if null cell is on top side
        if(cellIdx >= dimenshion) {
            if(myModel.get(cellIdx - dimenshion).display === -1) {
                myModel.move(cellIdx, cellIdx - dimenshion, 1)
                myModel.move(cellIdx - dimenshion + 1, cellIdx, 1)
            }
        }

        // if null cell is on bot side
        if(cellIdx < dimenshion * (dimenshion - 1)) {
            if(myModel.get(cellIdx + dimenshion).display === -1) {
                myModel.move(cellIdx, cellIdx + dimenshion, 1)
                myModel.move(cellIdx + dimenshion - 1, cellIdx, 1)
            }
        }
    }

    function createRandomField(newDimenshion) {

        dimenshion = newDimenshion;
        myModel.clear()
        for (var i = 0; i < dimenshion * dimenshion - 1; i++) {
            trueVector[i] = i + 1
            myModel.append( {"display": trueVector[i]} )
        }
        trueVector[dimenshion * dimenshion - 1] = -1
        myModel.append( {"display": trueVector[dimenshion * dimenshion - 1]} )

        var randVector = []

        while(randVector.length < dimenshion * dimenshion - 1) {
            var newVal = (Math.random() * (dimenshion * dimenshion - 1)).toFixed(0)
            if(isContained(randVector, newVal) === false && newVal > 0) {
                randVector.push(newVal)
            }
        }
        randVector.push(-1)

        myModel.move(findCellIdx(myModel, randVector[0]), 0, 1)
        // for(i = 0; i < myModel.count; i++) {
        //     console.log("move " + findCellIdx(myModel, randVector[i]) + " to " + i)
        //     myModel.move(findCellIdx(myModel, randVector[i]), i, 1)
        // }
    }

    Rectangle {
        id: parentItem

        Layout.fillWidth: true
        Layout.fillHeight: true

        ListModel {
            id: myModel
        }

        GridView {
            id: grid

            anchors.fill: parent

            model: myModel

            cellWidth: parent.width / dimenshion
            cellHeight: parent.height / dimenshion

            delegate: Cell {
                width: grid.cellWidth
                height: grid.cellHeight
                display: model.display
                onClicked: swapWithNull(display)
            }

            move: Transition {
                NumberAnimation { properties: "x,y"; duration: 300 }
            }
            populate: Transition {
                NumberAnimation { properties: "x,y"; duration: 1000 }
            }
            displaced: Transition {
                NumberAnimation { properties: "x,y"; duration: 1000 }
            }
        }
    }
}
