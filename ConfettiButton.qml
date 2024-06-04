import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Particles
import Qt5Compat.GraphicalEffects

Item {
    id: root
    
    property string color: "#0496ff"
    property double radius: 5.0
    property string text: "Celebrate"
    property string textColor: "#fff"
    property int fontSize: 15
    property string shadowColor: Qt.darker(color, 1.5)
    
    property list<string> imageSources: [
        "qrc:/images/1.svg",
        "qrc:/images/2.svg",
        "qrc:/images/3.svg",
    ]
    
    function randomInRange(min, max) {
        return Math.random() * (max - min) + min;
    }
    
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
            radius: 11
            samples: 20
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
        
        onClicked: {
            emitter.enabled = true
            emitter.burst()
            root.buttonClicked()
        }
        
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
    
    Timer{
        id: timer
        repeat: false
        interval: 1200
        onTriggered: {
            emitter.enabled = false
        }
    }
    
    ParticleSystem {
        id: confetti
        running: true
        anchors.fill: parent
        z: -100
        
        Emitter {
            id: emitter
            anchors.fill: parent
            emitRate: 0
            lifeSpan: 1000
            lifeSpanVariation: 100
            size: randomInRange(2, 5)
            endSize: randomInRange(10, 14)
            z: -100
            
            velocity: AngleDirection {
                angle: 90
                angleVariation: 360
                magnitude: 100
                magnitudeVariation: 120
            }
            
            function burst() {
                imgParticle.source = imageSources[Math.floor(Math.random() * imageSources.length)]
                emitter.emitRate = 100;
                timer.start()
            }
        }
        
        ImageParticle {
            id: imgParticle
            source: imageSources[Math.floor(Math.random() * imageSources.length)]
            alpha: 1.0
            alphaVariation: 1.0
            z: -100
            
            Behavior on alpha {
                NumberAnimation {
                    from: 1.0
                    to: 0.0
                    duration: 1000
                }
            }
        }
    }
}