import QtQuick 2.0

MouseArea {

    id: cell

    property var display: 1

    function moveTo(direction) {
        switch(direction){
            case "top":   cell.state = 'topState';   break;
            case "bot":   cell.state = 'botState';   break;
            case "left":  cell.state = 'leftState';  break;
            case "right": cell.state = 'rightState'; break;
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#80ff80"
        border.color: "#ff8080"
        border.width: 2
        visible: display == -1 ? false : true
        z: display == -1 ? 0 : 1
        radius: 10
        anchors.margins: 5

        Text {
            anchors.centerIn: parent
            text: display == -1 ? qsTr("") : qsTr(display.toString())
            font.pixelSize: 50
        }
    }

    states: [
        State {
            name: "topState"
            PropertyChanges { target: cell; y: cell.y - cell.height }
        },

        State {
            name: "botState"
            PropertyChanges { target: cell; y: cell.y + cell.height  }
        },

        State {
            name: "leftState"
            PropertyChanges { target: cell; x: cell.x - cell.width  }
        },

        State {
            name: "rightState"
            PropertyChanges { target: cell; x: cell.x + cell.width  }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "*"
            NumberAnimation { properties: "x,y"; easing.type: Easing.InOutQuad; duration: 1000 }
        }
    ]

    //onClicked: AppCore.clickOn(uid)
    //onClicked: moveTo("left")
}
