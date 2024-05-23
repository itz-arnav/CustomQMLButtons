import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Particles 2.15

Rectangle {
    
    property list<string> imageSources: [
        "qrc:/images/confetti_1.png",
        "qrc:/images/confetti_2.png",
        "qrc:/images/confetti_3.png",
        // "qrc:/images/confetti_yellow.png",
        // "qrc:/images/confetti_purple.png"
    ]
    
    signal buttonClicked()
    
    Rectangle {
        id: button
        width: 200
        height: 50
        color: "skyblue"
        radius: 10
        border.color: "darkblue"
        border.width: 2
        anchors.centerIn: parent
        z: 999
        
        Text {
            text: "Celebrate!"
            anchors.centerIn: parent
            font.pixelSize: 20
        }
        
        MouseArea {
            anchors.fill: parent
            onClicked: {
                emitter.enabled = true
                emitter.burst()
                buttonClicked()
            }
        }
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
                emitter.emitRate = 400;
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
