import QtQuick 2.15
import org.kde.plasma.core 2.0 as PlasmaCore

Rectangle {
    id: root
    color: "black"

    width: 1024
    height: 768

    FontLoader {
        id: fixedFont
        source: "gluqlo.ttf"
    }

    PlasmaCore.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: "Local"
        interval: 60000
        intervalAlignment: PlasmaCore.Types.AlignToMinute
        onDataChanged: {
            updateTime()
        }
    }

    function updateTime() {
        h = dataSource.data["Local"]["DateTime"].getHours()
        root.hour = (h % 12 == 0) ? 12 : (h % 12)
        root.min = dataSource.data["Local"]["DateTime"].getMinutes()
        root.meridem = (h >= 12) ? "PM" : "AM"
    }

    property int hour
    property int min
    property string meridem

    // helper for testing animation
    // Timer {
    //     running: true
    //     interval: 4000
    //     repeat: true
    //     onTriggered: {
    //         root.hour++
    //         root.min++
    //         root.meridem = root.meridem == "AM" ? "PM" : "AM"
    //     }
    // }


    Digit {
        id: hours
        height: root.height * 0.6
        width: Math.min(parent.width * 0.3, height)
        anchors.rightMargin: parent.width * 0.01
        font: fixedFont.name
        anchors.verticalCenter: root.verticalCenter
        anchors.right: min.left
        number: root.hour
        onNumberChanged: flipEffectHours.flip()
    }

    FlipEffect {
        id: flipEffectHours
        sourceItem: hours
        anchors.fill: hours
    }


    Digit {
        id: min
        height: root.height * 0.6
        width: Math.min(parent.width * 0.3, height)
        anchors.leftMargin: parent.width * 0.01
        font: fixedFont.name
        anchors.verticalCenter: root.verticalCenter
        anchors.horizontalCenter: root.horizontalCenter
        number: root.min
        onNumberChanged: flipEffectMin.flip()
    }

    FlipEffect {
        id: flipEffectMin
        sourceItem: min
        anchors.fill: min
    }


    Meridem {
        id: meridem
        height: root.height * 0.6
        width: Math.min(parent.width * 0.3, height)
        anchors.leftMargin: parent.width * 0.01
        anchors.verticalCenter: root.verticalCenter
        anchors.left: min.right
        value: root.meridem
        onValueChanged: flipEffectMeridem.flip()
    }

    FlipEffect {
        id: flipEffectMeridem
        sourceItem: meridem
        anchors.fill: meridem
    }
}
