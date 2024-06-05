import QtQuick
import QtQuick.Controls.Fusion
import Qt5Compat.GraphicalEffects

Item {
    id: root

    property string loadingSpinnerColor: Qt.darker(color, 1.4)
    property string color: "#6c757d"
    property string loadingBackgroundColor: Qt.lighter(color, 1.1)
    property double radius: 5.0
    property string text: "Click Me"
    property string textColor: "#fff"
    property int fontSize: 15
    property int iconSize: 40
    property int indicatorSize: 80
    property string shadowColor: Qt.darker(color, 1.1)

    signal buttonClicked()

    width: contentWrapper.width + contentWrapper.leftPadding + contentWrapper.rightPadding
    height: contentWrapper.height + contentWrapper.topPadding + contentWrapper.bottomPadding

    //Background rectangle
    Rectangle{
        id: backgroundContainer

        anchors.fill: parent
        color: root.color
        radius: root.radius

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: root.shadowColor
            radius: 15
            samples: 35
            horizontalOffset: 1
            verticalOffset: 1
        }
    }

    Rectangle{
        id: loadingProgressBar
        height: parent.height
        width: 0
        color: root.loadingSpinnerColor
    }

    //Content label
    Label{
        id: contentWrapper

        text: root.text
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: root.fontSize
        color: root.textColor
    }

    BusyIndicator{
        id: busyIndicator
        visible: false
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        palette.text: root.loadingBackgroundColor
        width: root.indicatorSize
        height: root.indicatorSize
    }

    Image{
        id: imageIcon
        source: "qrc:/images/check.svg"
        width: root.iconSize
        height: root.iconSize
        visible: false
        anchors.centerIn: parent
    }

    //Handling Mouse Events
    MouseArea{
        id: mouseEventWrapper

        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: {
            root.buttonClicked()

            if(imageIcon.visible){
                contentWrapper.visible = true
                busyIndicator.visible = false
                imageIcon.visible = false
                loadingProgressBar.width = 0
            }else if(busyIndicator.visible){
                contentWrapper.visible = true
                busyIndicator.visible = false
                imageIcon.visible = false
                loadingAnimation.stop()
                loadingProgressBar.width = 0
            }else{
                contentWrapper.visible = false
                busyIndicator.visible = true
                imageIcon.visible = false
                loadingAnimation.start()
            }
        }
    }

    NumberAnimation{
        id: loadingAnimation
        target: loadingProgressBar
        property: "width"
        to: root.width
        duration: 1000
        easing.type: Easing.InOutQuad
        onFinished: {
            busyIndicator.visible = false
            imageIcon.visible = true
        }
    }
}
