import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    id: parentItem
    Layout.fillWidth: true
    Layout.fillHeight: true

    property var dimenshion: 3
    property var rndVector: [1,2,3,4,5,6,7,8,9]

    function appendModel() {
        myModel.clear()
        for (var i = 0; i < dimenshion * dimenshion; i++) {
            myModel.append( {"display": rndVector[i], "uid": i} )
        }
    }

    ListModel {
        id: myModel
    }

    Grid {
        id: gridLayout

        columns: dimenshion
        rows: dimenshion

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.margins: 5

        spacing: 5

        Repeater {

            model: myModel

            delegate: Cell {
                width: parent.width / dimenshion - spacing
                height: parent.height / dimenshion - spacing
                display: model.display;
                uid: model.uid;
            }
        }
    }
}
