import QtQuick 
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Item {
    id: root
    
    property string color: "#3dccc7"
    property double radius: 5.0
    property string text: "Click Me"
    property string textColor: "#fff"
    property int fontSize: 15
    property string shadowColor: Qt.darker(color, 1.6)
    
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
            colorAnimation.to = Qt.darker(backgroundContainer.color, 1.3)
            colorAnimation.start()
        }
        onExited: {
            colorAnimation.to = root.color
            colorAnimation.start()
        }
    }
    
    //Colour animation for hover effects
    ColorAnimation {
        id: colorAnimation
        
        target: backgroundContainer
        property: "color"
        duration: 300
        easing.type: Easing.InOutQuad
    }
}
