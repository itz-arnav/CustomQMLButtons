import QtQuick
import QtQuick.Controls.Fusion
import Qt5Compat.GraphicalEffects

Item {
    id: loadingButton

    property string baseColor: "#6c757d"
    property string spinnerColor: Qt.darker(baseColor, 1.45)
    property string highlightColor: Qt.lighter(baseColor, 1.1)
    property double borderRadius: 5.0
    property string buttonText: "Click Me"
    property string textColor: "#ffffff"
    property int fontSize: 15
    property int iconDimension: 50
    property int busyIndicatorSize: 60
    property string shadowColor: Qt.darker(baseColor, 1.1)

    signal buttonClicked()

    width: textLabel.width + textLabel.leftPadding + textLabel.rightPadding
    height: textLabel.height + textLabel.topPadding + textLabel.bottomPadding

    // Background with shadow
    Rectangle {
        id: background
        anchors.fill: parent
        color: loadingButton.baseColor
        radius: loadingButton.borderRadius

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: loadingButton.shadowColor
            radius: 15
            samples: 35
            horizontalOffset: 1
            verticalOffset: 1
        }
    }

    // Progress bar for loading indication
    Rectangle {
        id: progressBar
        height: parent.height
        width: 0
        color: loadingButton.spinnerColor
    }

    // Text label
    Label {
        id: textLabel
        text: loadingButton.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: loadingButton.fontSize
        color: loadingButton.textColor
    }

    // Busy indicator
    BusyIndicator {
        id: busyIndicator
        visible: false
        anchors.centerIn: parent
        width: loadingButton.busyIndicatorSize
        height: loadingButton.busyIndicatorSize
        palette.text: loadingButton.highlightColor
    }

    // Icon image
    Image {
        id: icon
        source: "qrc:/images/check.svg"
        width: loadingButton.iconDimension
        height: loadingButton.iconDimension
        visible: false
        anchors.centerIn: parent
    }

    // Interaction handling
    MouseArea {
        id: interactionArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: {
            loadingButton.buttonClicked()

            if (icon.visible) {
                textLabel.visible = true
                busyIndicator.visible = false
                icon.visible = false
                progressBar.width = 0
            } else if (busyIndicator.visible) {
                textLabel.visible = true
                busyIndicator.visible = false
                icon.visible = false
                loadingAnimation.stop()
                progressBar.width = 0
            } else {
                textLabel.visible = false
                busyIndicator.visible = true
                icon.visible = false
                loadingAnimation.start()
            }
        }
    }

    // Loading animation
    NumberAnimation {
        id: loadingAnimation
        target: progressBar
        property: "width"
        to: loadingButton.width
        duration: 1000
        easing.type: Easing.InOutQuad
        onFinished: {
            busyIndicator.visible = false
            icon.visible = true
        }
    }
}