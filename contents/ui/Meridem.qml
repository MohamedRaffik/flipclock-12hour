import QtQuick 2.15

Rectangle {
    id: root
    property string value
    radius: height *  0.05

    color: "#0f0f0f"

    Text {
        id: meridem
        text: value
        anchors.fill: parent
        color: "#b7b7b7"
        anchors.leftMargin: root.width * 0.1
        anchors.rightMargin: root.width * 0.1
        font.pixelSize: Math.min(height * 0.8, width * 0.8)
        font.family: fixedFont.name
        renderType: Text.QtRendering
        horizontalAlignment:  Text.AlignHCenter
        verticalAlignment:  Text.AlignVCenter
    }
}
