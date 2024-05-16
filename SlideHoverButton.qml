import QtQuick 
import QtQuick.Controls.Basic

Item {
    id: root
    
    property string bgColor: "#353535"
    property string hoverBgColor: "#F7CA18"
    property double radius: 5.0
    property string text: "Click Me"
    property string textColor: "#fff"
    property string hoverTextColor: "#fff"
    property int fontSize: 15
    property string shadowColor: Qt.darker(color, 1.5)
    
    signal buttonClicked()
    
    width: contentWrapper.width + contentWrapper.leftPadding + contentWrapper.rightPadding
    height: contentWrapper.height + contentWrapper.topPadding + contentWrapper.bottomPadding
    
    //Background rectangle
    Rectangle{
        id: backgroundContainer
        
        anchors.fill: parent
        color: root.bgColor
        radius: root.radius
        border.color: root.hoverBgColor
        border.width: 3
    }
    
    Rectangle{
        id: backgroundHoverContainer
        height: parent.height
        width: 0
        color: root.hoverBgColor
        radius: root.radius
        border.color: root.hoverBgColor
        border.width: 3
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
    
    //Animation for entering hover effects
    ParallelAnimation {
        id: hoverEnterAnimation
        
        //Scale the background
        ColorAnimation {
            target: contentWrapper
            property: "color"
            to: root.hoverTextColor
            duration: 300
            easing.type: Easing.InOutQuad
        }
        
        //Sliding from the left
        NumberAnimation {
            target: backgroundHoverContainer
            property: "width"
            to: backgroundContainer.width
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }
    
    
    //Animation for exiting hover effects
    ParallelAnimation {
        id: hoverExitAnimation
        
        //Scale the background
        ColorAnimation {
            target: contentWrapper
            property: "color"
            to: root.textColor
            duration: 300
            easing.type: Easing.InOutQuad
        }
        
        //Sliding from the left
        NumberAnimation {
            target: backgroundHoverContainer
            property: "width"
            to: 0
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }
}
