import QtQuick 
import QtQuick.Controls.Basic

Item {
    id: root
    
    property string color: Qt.darker("#ff3466", 1.1)
    property double radius: 20.0
    property string text: "Click Me"
    property string textColor: "#fff"
    property int fontSize: 15
    property string shadowColor: Qt.darker(color, 1.5)
    
    signal buttonClicked()
    
    width: contentWrapper.width + contentWrapper.leftPadding + contentWrapper.rightPadding
    height: contentWrapper.height + contentWrapper.topPadding + contentWrapper.bottomPadding
    
    //Pulse background
    Rectangle {
        id: pulsingBackground
        anchors.fill: parent
        color: Qt.lighter(root.color, 1.4)
        radius: root.radius
        opacity: 0.8
        
        ParallelAnimation {
            running: true
            loops: Animation.Infinite
            
            //Scale the background
            PropertyAnimation {
                target: pulsingBackground
                property: "scale"
                to: 1.3
                duration: 1300
            }
            
            //Reduce the opacity to fade-out
            NumberAnimation {
                target: pulsingBackground
                property: "opacity"
                to: 0.3
                duration: 1300
            }
        }
    }
    
    
    //Background rectangle
    Rectangle{
        id: backgroundContainer
        
        anchors.fill: parent
        color: root.color
        radius: root.radius
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
            colorAnimation.to = Qt.darker(backgroundContainer.color, 1.1)
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
