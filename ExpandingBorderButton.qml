import QtQuick 
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Item {
    id: root
    property color bordercolor: "#ef3f5f"
    property string color: "transparent"
    property double radius: 5.0
    property string text: "Click Me"
    property string textColor: "#fff"
    property int fontSize: 15
    property real borderTopWidth: 0.15 * width
    property real borderLeftWidth: 0.15 * height
    property real borderDownWidth: 0.15 * width
    property real borderRightWidth: 0.15 * height
    property int dropShadowRadius: 0
    property int dropShadowSamples: 0
    
    signal buttonClicked()
    
    width: contentWrapper.width + contentWrapper.leftPadding + contentWrapper.rightPadding
    height: contentWrapper.height + contentWrapper.topPadding + contentWrapper.bottomPadding
    
    states: [
        State {
            name: "hovered"
            PropertyChanges {
                target: root
                borderTopWidth: width
                borderLeftWidth: height
                borderDownWidth: width
                borderRightWidth: height
            }
        }
    ]
    
    //Background rectangle
    Rectangle{
        id: backgroundContainer
        
        anchors.fill: parent
        color: "#353535"
        
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: root.bordercolor
            radius: dropShadowRadius
            samples: dropShadowSamples
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
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        
        onEntered: {
            root.state = "hovered"
        }
        onExited: {
            root.state = ""
        }
    }
    
    Rectangle {
        width: root.borderTopWidth
        height: 2
        color: root.bordercolor
        anchors.top: parent.top
        anchors.left: parent.left
    }
    
    Rectangle {
        width: 2
        height: root.borderLeftWidth
        color: root.bordercolor
        anchors.top: parent.top
        anchors.left: parent.left
    }
    
    Rectangle {
        width: root.borderDownWidth
        height: 2
        color: root.bordercolor
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }
    
    Rectangle {
        width: 2
        height: root.borderRightWidth
        color: root.bordercolor
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }
    
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        
        onClicked: root.buttonClicked()
    }
    
    transitions: [
        Transition {
            from: ""
            to: "hovered"
            PropertyAnimation {
                target: root
                property: "borderTopWidth"
                duration: 300
            }
            PropertyAnimation {
                target: root
                property: "borderLeftWidth"
                duration: 300
            }
            PropertyAnimation {
                target: root
                property: "borderDownWidth"
                duration: 300
            }
            PropertyAnimation {
                target: root
                property: "borderRightWidth"
                duration: 300
            }
            NumberAnimation {
                target: root
                property: "dropShadowRadius"
                to: 70
                duration: 300
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: root
                property: "dropShadowSamples"
                to: 210
                duration: 300
                easing.type: Easing.InOutQuad
            }
        },
        Transition {
            from: "hovered"
            to: ""
            PropertyAnimation {
                target: root
                property: "borderTopWidth"
                duration: 300
            }
            PropertyAnimation {
                target: root
                property: "borderLeftWidth"
                duration: 300
            }
            PropertyAnimation {
                target: root
                property: "borderDownWidth"
                duration: 300
            }
            PropertyAnimation {
                target: root
                property: "borderRightWidth"
                duration: 300
            }
            NumberAnimation {
                target: root
                property: "dropShadowRadius"
                to: 0
                duration: 300
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: root
                property: "dropShadowSamples"
                to: 0
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
    ]
}
