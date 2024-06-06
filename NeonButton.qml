import QtQuick 
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Item {
    id: neonButton
    
    property string baseColor: "transparent"
    property color borderColor: "#2dc653"
    property double borderRadius: 5.0
    property string buttonText: "Click Me"
    property color textColor: "#ffffff"
    property int fontSize: 15
    property color shadowColor: Qt.darker(borderColor, 1.5)
    property color hoverShadowColor: Qt.lighter(borderColor, 1.1)
    property color exitShadowColor: Qt.darker(borderColor, 1.5)
    property int shadowRadius: 3
    property int shadowSamples: 7
    
    signal buttonClicked()
    
    width: contentWrapper.width + contentWrapper.leftPadding + contentWrapper.rightPadding
    height: contentWrapper.height + contentWrapper.topPadding + contentWrapper.bottomPadding
    
    Rectangle {
        id: backgroundContainer
        anchors.fill: parent
        color: neonButton.baseColor
        radius: neonButton.borderRadius
        border.width: 1
        border.color: neonButton.borderColor
        
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: neonButton.shadowColor
            radius: neonButton.shadowRadius
            samples: neonButton.shadowSamples
            horizontalOffset: 1
            verticalOffset: 1
        }
    }
    
    Label {
        id: contentWrapper
        text: neonButton.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: neonButton.fontSize
        color: neonButton.textColor
    }
    
    MouseArea {
        id: mouseEventWrapper
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        
        onClicked: neonButton.buttonClicked()
        onEntered: hoverEnterAnimation.start()
        onExited: hoverExitAnimation.start()
    }
    
    ParallelAnimation {
        id: hoverEnterAnimation
        running: false
        ColorAnimation {
            target: backgroundContainer
            property: "color"
            to: neonButton.borderColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            target: neonButton
            property: "shadowColor"
            to: neonButton.hoverShadowColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: neonButton
            property: "shadowRadius"
            to: 22
            duration: 50
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: neonButton
            property: "shadowSamples"
            to: 50
            duration: 50
            easing.type: Easing.InOutQuad
        }
    }
    
    ParallelAnimation {
        id: hoverExitAnimation
        ColorAnimation {
            target: backgroundContainer
            property: "color"
            to: neonButton.baseColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            target: neonButton
            property: "shadowColor"
            to: neonButton.exitShadowColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: neonButton
            property: "shadowRadius"
            to: 3
            duration: 50
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: neonButton
            property: "shadowSamples"
            to: 7
            duration: 50
            easing.type: Easing.InOutQuad
        }
    }
}