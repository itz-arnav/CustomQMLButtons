import QtQuick 
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Item {
    id: hoverButton

    property string baseColor: "#3dccc7"
    property double borderRadius: 5.0
    property string buttonText: "Click Me"
    property string textColor: "#ffffff"
    property int textFontSize: 15
    property string shadowColor: Qt.darker(baseColor, 1.6)

    signal buttonClicked()

    width: buttonLabel.width + buttonLabel.leftPadding + buttonLabel.rightPadding
    height: buttonLabel.height + buttonLabel.topPadding + buttonLabel.bottomPadding

    // Background with shadow effect
    Rectangle {
        id: buttonBackground
        anchors.fill: parent
        color: hoverButton.baseColor
        radius: hoverButton.borderRadius

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: hoverButton.shadowColor
            radius: 15
            samples: 35
            horizontalOffset: 1
            verticalOffset: 1
        }
    }

    // Text label
    Label {
        id: buttonLabel
        text: hoverButton.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: hoverButton.textFontSize
        color: hoverButton.textColor
    }

    // Mouse interaction area
    MouseArea {
        id: interactionArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: hoverButton.buttonClicked()
        onEntered: {
            hoverEffect.to = Qt.darker(buttonBackground.color, 1.3)
            hoverEffect.start()
        }
        onExited: {
            hoverEffect.to = hoverButton.baseColor
            hoverEffect.start()
        }
    }

    // Color animation for hover effects
    ColorAnimation {
        id: hoverEffect
        target: buttonBackground
        property: "color"
        duration: 300
        easing.type: Easing.InOutQuad
    }
}