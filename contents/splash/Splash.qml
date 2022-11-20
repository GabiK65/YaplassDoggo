import QtQuick 2.5


Rectangle {
    id: root
    color: "#141414"

     property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
      }


    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            property real size: units.gridUnit * 14

            anchors.centerIn: parent

            source: "images/doggo.svg"

            sourceSize.width: size
            sourceSize.height: size
        }

    }

    OpacityAnimator {
        id: introAnimation
        running: true
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
