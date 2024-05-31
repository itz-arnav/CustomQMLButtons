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
        "qrc:/images/confetti_1.png",
        "qrc:/images/confetti_2.png",
        "qrc:/images/confetti_3.png",
    ]
    
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
            timer2.stop()
            emitter.enabled = false
        }
    }
    
    Timer{
        id: timer2
        repeat: true
        interval: 700
        onTriggered: {
            imgParticle.source = imageSources[Math.floor(Math.random() * imageSources.length)]
        }
    }
    
    ParticleSystem {
        id: confetti
        running: true
        anchors.fill: parent
        

        Emitter {
            id: emitter
            anchors.fill: parent
            emitRate: 0
            lifeSpan: 1000
            lifeSpanVariation: 100
            size: 5
            endSize: 10 
            velocity: AngleDirection {
                angle: 90
                angleVariation: 360
                magnitude: 100
                magnitudeVariation: 120
            }
            
            function burst() {
                emitter.emitRate = 100;
                timer.start()
                timer2.start()
            }
        }
        
        ImageParticle {
            id: imgParticle
            source: imageSources[Math.floor(Math.random() * imageSources.length)]
            alpha: 1.0
            
            Behavior on alpha {
                NumberAnimation {
                    from: 1.0
                    to: 0.0
                    duration: 700
                }
            }
        }
    }
}