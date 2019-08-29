import QtQuick 2.0

MouseArea {

    id: cell

    property var display: 1
    property var uid: 1

    Rectangle {
        anchors.fill: parent
        color: "#80ff80"
        border.color: "#ff8080"
        border.width: 2
        visible: display == -1 ? false : true

        Text {
            anchors.centerIn: parent
            text: display == -1 ? qsTr("") : qsTr(display.toString())
            font.pixelSize: 50
        }
    }

    onClicked: {
        console.log("id " + uid.toString() + ", val " + display.toString())
    }
}
