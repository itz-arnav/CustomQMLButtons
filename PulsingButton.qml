import QtQuick 
import QtQuick.Controls.Basic

Item {
    id: interactiveButton

    property string baseColor: Qt.darker("#ff3466", 1.1)
    property double borderRadius: 20.0
    property string buttonText: "Click Me"
    property string textColor: "#ffffff"
    property int textFontSize: 15

    signal buttonClicked()

    width: textLabel.width + textLabel.leftPadding + textLabel.rightPadding
    height: textLabel.height + textLabel.topPadding + textLabel.bottomPadding

    // Pulse effect background
    Rectangle {
        id: pulsingBackground
        anchors.fill: parent
        color: Qt.lighter(interactiveButton.baseColor, 1.4)
        radius: interactiveButton.borderRadius
        opacity: 0.8

        ParallelAnimation {
            running: true
            loops: Animation.Infinite
            PropertyAnimation {
                target: pulsingBackground
                property: "scale"
                to: 1.3
                duration: 1300
            }
            NumberAnimation {
                target: pulsingBackground
                property: "opacity"
                to: 0.3
                duration: 1300
            }
        }
    }
    
    // Static background
    Rectangle {
        id: background
        anchors.fill: parent
        color: interactiveButton.baseColor
        radius: interactiveButton.borderRadius
    }
    
    // Text label
    Label {
        id: textLabel
        text: interactiveButton.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: interactiveButton.textFontSize
        color: interactiveButton.textColor
    }
    
    // Interaction area for mouse events
    MouseArea {
        id: interactionArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        
        onClicked: interactiveButton.buttonClicked()
        onEntered: {
            hoverEffect.to = Qt.darker(background.color, 1.1)
            hoverEffect.start()
        }
        onExited: {
            hoverEffect.to = interactiveButton.baseColor
            hoverEffect.start()
        }
    }
    
    // Color animation for hover effects
    ColorAnimation {
        id: hoverEffect
        target: background
        property: "color"
        duration: 300
        easing.type: Easing.InOutQuad
    }
}