import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Particles
import Qt5Compat.GraphicalEffects

Item {
    id: root
    
    property string baseColor: "#0496ff"
    property double borderRadius: 5.0
    property string buttonText: "Celebrate"
    property color textColor: "#ffffff"
    property int fontSize: 15
    property color shadowColor: Qt.darker(baseColor, 1.5)
    property list<string> imageSources: [
        "qrc:/images/1.svg",
        "qrc:/images/2.svg",
        "qrc:/images/3.svg"
    ]
    
    signal buttonClicked()
    
    width: label.width + label.leftPadding + label.rightPadding
    height: label.height + label.topPadding + label.bottomPadding
    
    
    function randomInRange(min, max) {
        return Math.random() * (max - min) + min;
    }
    
    // Background rectangle with shadow
    Rectangle {
        id: background
        anchors.fill: parent
        color: root.baseColor
        radius: root.borderRadius
        
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: root.shadowColor
            radius: 11
            samples: 20
            horizontalOffset: 1
            verticalOffset: 1
        }
    }
    
    // Text label
    Label {
        id: label
        text: root.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: root.fontSize
        color: root.textColor
    }
    
    // Mouse area for interaction
    MouseArea {
        id: interactionArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        
        onClicked: {
            confettiEmitter.enabled = true
            confettiEmitter.burst()
            root.buttonClicked()
        }
        
        onEntered: hoverAnimation.to = Qt.darker(background.color, 1.1)
        onExited: hoverAnimation.to = root.baseColor
    }
    
    // Color animation for hover effects
    ColorAnimation {
        id: hoverAnimation
        target: background
        property: "color"
        duration: 300
        easing.type: Easing.InOutQuad
    }
    
    // Particle system for confetti effect
    ParticleSystem {
        id: confettiSystem
        running: true
        anchors.fill: parent
        z: -1

        Emitter {
            id: confettiEmitter
            anchors.fill: parent
            enabled: false
            emitRate: 0
            lifeSpan: 1000
            lifeSpanVariation: 100
            size: randomInRange(2, 4)
            endSize: randomInRange(6, 9)
            z: -1
            
            velocity: AngleDirection {
                angle: 90
                angleVariation: 360
                magnitude: 100
                magnitudeVariation: 120
            }
            
            function burst() {
                imgParticle.source = imageSources[Math.floor(Math.random() * imageSources.length)]
                emitRate = 100
                confettiTimer.start()
            }
        }
        
        ImageParticle {
            id: imgParticle
            source: imageSources[0]
            alpha: 1.0
            alphaVariation: 0.5
            Behavior on alpha {
                NumberAnimation {
                    from: 1.0
                    to: 0.0
                    duration: 1000
                }
            }
        }
        
        Timer {
            id: confettiTimer
            interval: 1200
            repeat: false
            onTriggered: confettiEmitter.enabled = false
        }
    }
}