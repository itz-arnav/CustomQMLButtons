import QtQuick 
import QtQuick.Controls.Basic

Item {
    id: clickableButton

    property string baseColor: "#353535"
    property string hoverColor: "#F7CA18"
    property double borderRadius: 5.0
    property string buttonText: "Click Me"
    property string textColor: "#ffffff"
    property string hoverTextColor: "#ffffff"
    property int textFontSize: 15
    property string shadowColor: Qt.darker(baseColor, 1.5)
    
    signal buttonClicked()

    width: labelContent.width + labelContent.leftPadding + labelContent.rightPadding
    height: labelContent.height + labelContent.topPadding + labelContent.bottomPadding

    // Static background of the button
    Rectangle {
        id: background
        anchors.fill: parent
        color: clickableButton.baseColor
        radius: clickableButton.borderRadius
        border.color: clickableButton.hoverColor
        border.width: 3
    }
    
    // Dynamic hover background effect
    Rectangle {
        id: hoverEffect
        height: parent.height
        width: 0
        color: clickableButton.hoverColor
        radius: clickableButton.borderRadius
        border.color: clickableButton.hoverColor
        border.width: 3
    }
    
    // Label displaying button text
    Label {
        id: labelContent
        text: clickableButton.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: clickableButton.textFontSize
        color: clickableButton.textColor
    }
    
    // Mouse area for interaction
    MouseArea {
        id: interactionArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: clickableButton.buttonClicked()
        onEntered: enterHoverAnimation.start()
        onExited: exitHoverAnimation.start()
    }
    
    // Animations for hover effect
    ParallelAnimation {
        id: enterHoverAnimation
        
        ColorAnimation {
            target: labelContent
            property: "color"
            to: clickableButton.hoverTextColor
            duration: 300
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: hoverEffect
            property: "width"
            to: background.width
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }
    
    ParallelAnimation {
        id: exitHoverAnimation
        
        ColorAnimation {
            target: labelContent
            property: "color"
            to: clickableButton.textColor
            duration: 300
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: hoverEffect
            property: "width"
            to: 0
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }
}