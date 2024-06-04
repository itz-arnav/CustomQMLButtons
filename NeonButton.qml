import QtQuick 
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Item {
    id: root
    
    property string color: "transparent"
    property string borderColor: "#2dc653"
    property double radius: 5.0
    property string text: "Click Me"
    property string textColor: "#fff"
    property int fontSize: 15
    property string shadowColor: Qt.darker(borderColor, 1.5)
    property string hoverShadowColor: Qt.lighter(borderColor, 1.1)
    property string exitShadowColor: Qt.darker(borderColor, 1.5)
    property int dropShadowRadius: 3
    property int dropShadowSamples: 7
    
    signal buttonClicked()
    
    width: contentWrapper.width + contentWrapper.leftPadding + contentWrapper.rightPadding
    height: contentWrapper.height + contentWrapper.topPadding + contentWrapper.bottomPadding
    
    //Background rectangle
    Rectangle{
        id: backgroundContainer
        
        anchors.fill: parent
        color: root.color
        radius: root.radius
        border.width: 1
        border.color: root.borderColor
        
        layer.enabled: true
        layer.effect: DropShadow {            
            transparentBorder: true
            color: root.shadowColor
            radius: dropShadowRadius
            samples: dropShadowSamples
            horizontalOffset: 1
            verticalOffset: 1
        }
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
    
    //Handling Mouse Events
    MouseArea{
        id: mouseEventWrapper
        
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        
        onClicked: root.buttonClicked()
        onEntered: {
            hoverEnterAnimation.start()
        }
        onExited: {
            hoverExitAnimation.start()
        }
    }
    
    // Parallel animation for hover enter effects
    ParallelAnimation {
        running: false
    
        id: hoverEnterAnimation
        ColorAnimation {
            target: backgroundContainer
            property: "color"
            to: borderColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            target: root
            property: "shadowColor"
            to: hoverShadowColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: root
            property: "dropShadowRadius"
            to: 70
            duration: 50
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: root
            property: "dropShadowSamples"
            to: 210
            duration: 50
            easing.type: Easing.InOutQuad
        }
    }
    
    // Parallel animation for hover exit effects
    ParallelAnimation {
        id: hoverExitAnimation
        ColorAnimation {
            target: backgroundContainer
            property: "color"
            to: root.color
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            target: root
            property: "shadowColor"
            to: exitShadowColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: root
            property: "dropShadowRadius"
            to: 3
            duration: 50
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: root
            property: "dropShadowSamples"
            to: 7
            duration: 50
            easing.type: Easing.InOutQuad
        }
    }
}
