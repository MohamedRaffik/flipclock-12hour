import QtQuick 2.15

Rectangle {
    id: root
    property int number
    property alias font: text.font.family
    property string meridem
    radius: height *  0.05

    color: "#0f0f0f"

    Text {
        id: meridem
        text: root.meridem
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.05
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.05
        font.pixelSize: Math.min(parent.height * 0.1, parent.width * 0.1)
        color: "#b7b7b7"
        font.family: fixedFont.name
        renderType: Text.QtRendering
        horizontalAlignment:  Text.AlignHCenter
        verticalAlignment:  Text.AlignVCenter
    }

    Text {
        id: text
        text:  (root.number < 10 ? "0" : "") + root.number
        anchors.fill: parent
        color: "#b7b7b7"
        font.pixelSize: Math.min(height * 0.8, width * 0.8)
        font.family: fixedFont.name
        renderType: Text.QtRendering
        horizontalAlignment:  Text.AlignHCenter
        verticalAlignment:  Text.AlignVCenter
    }
}
