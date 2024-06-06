import QtQuick 
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
Item {
    id: interactiveButton
    
    property color borderColor: "#ef3f5f"
    property color baseColor: "#353535"
    property double borderRadius: 5.0
    property string buttonText: "Click Me"
    property color textColor: "#ffffff"
    property int fontSize: 15
    property real borderTopWidth: 0.15 * width
    property real borderLeftWidth: 0.15 * height
    property real borderDownWidth: 0.15 * width
    property real borderRightWidth: 0.15 * height
    property int shadowRadius: 0
    property int shadowSamples: 0
    
    signal buttonClicked()
    
    width: textLabel.width + textLabel.leftPadding + textLabel.rightPadding
    height: textLabel.height + textLabel.topPadding + textLabel.bottomPadding
    
    states: [
        State {
            name: "hovered"
            PropertyChanges {
                target: interactiveButton
                borderTopWidth: width
                borderLeftWidth: height
                borderDownWidth: width
                borderRightWidth: height
                shadowRadius: 22
                shadowSamples: 50
            }
        }
    ]
    
    Rectangle {
        id: background
        anchors.fill: parent
        color: interactiveButton.baseColor
        radius: interactiveButton.borderRadius
        
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: interactiveButton.borderColor
            radius: interactiveButton.shadowRadius
            samples: interactiveButton.shadowSamples
        }
    }
    
    Label {
        id: textLabel
        text: interactiveButton.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: interactiveButton.fontSize
        color: interactiveButton.textColor
    }
    
    // Handling mouse events
    MouseArea {
        id: interactionArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        
        onClicked: {
            interactiveButton.buttonClicked()
        }
        onEntered: interactiveButton.state = "hovered"
        onExited: interactiveButton.state = ""
    }
    
    // Border rectangles for visual effect
    Rectangle {
        width: interactiveButton.borderTopWidth
        height: 2
        color: interactiveButton.borderColor
        anchors.top: parent.top
        anchors.left: parent.left
    }
    
    Rectangle {
        width: 2
        height: interactiveButton.borderLeftWidth
        color: interactiveButton.borderColor
        anchors.top: parent.top
        anchors.left: parent.left
    }
    
    Rectangle {
        width: interactiveButton.borderDownWidth
        height: 2
        color: interactiveButton.borderColor
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }
    
    Rectangle {
        width: 2
        height: interactiveButton.borderRightWidth
        color: interactiveButton.borderColor
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }
    
    
    
    transitions: [
        Transition {
            from: ""
            to: "hovered"
            ParallelAnimation {
                PropertyAnimation {
                    target: interactiveButton
                    property: "borderTopWidth"
                    to: width
                    duration: 300
                }
                PropertyAnimation {
                    target: interactiveButton
                    property: "borderLeftWidth"
                    to: height
                    duration: 300
                }
                PropertyAnimation {
                    target: interactiveButton
                    property: "borderDownWidth"
                    to: width
                    duration: 300
                }
                PropertyAnimation {
                    target: interactiveButton
                    property: "borderRightWidth"
                    to: height
                    duration: 300
                }
                NumberAnimation {
                    target: interactiveButton
                    property: "shadowRadius"
                    to: 22
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: interactiveButton
                    property: "shadowSamples"
                    to: 50
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
        },
        Transition {
            from: "hovered"
            to: ""
            ParallelAnimation {
                PropertyAnimation {
                    target: interactiveButton
                    property: "borderTopWidth"
                    to: 0.15 * width
                    duration: 300
                }
                PropertyAnimation {
                    target: interactiveButton
                    property: "borderLeftWidth"
                    to: 0.15 * height
                    duration: 300
                }
                PropertyAnimation {
                    target: interactiveButton
                    property: "borderDownWidth"
                    to: 0.15 * width
                    duration: 300
                }
                PropertyAnimation {
                    target: interactiveButton
                    property: "borderRightWidth"
                    to: 0.15 * height
                    duration: 300
                }
                NumberAnimation {
                    target: interactiveButton
                    property: "shadowRadius"
                    to: 0
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: interactiveButton
                    property: "shadowSamples"
                    to: 0
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
        }
    ]
}