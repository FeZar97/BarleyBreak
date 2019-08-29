import QtQuick 2.0

Item {
    id: myCell

    property string cellText: qsTr("cell text")
    property int cellWidth: 50
    property int cellHeight: 50

    Rectangle {
        id: rect

        width: cellWidth - 4
        height: cellHeight - 4

        color: "yellow"
        border.color: "red"
        border.width: 2

        Text {
            anchors.centerIn: parent
            text: "parent.cellText"
        }
    }

    MouseArea {
        id: cellArea

        anchors.fill: rect
        // hoverEnabled: true
        // preventStealing : true
        // property int index: mainGrid.indexAt(mouseX, mouseY) //item underneath cursor
        // property int activeId: -1 //uid of active item
        // property int activeIndex //current position of active item

        onPressed: {
            // activeId = mainGrid.model.get(activeIndex=index).uid
            console.log(rect.cellText)
        }
    }
}
