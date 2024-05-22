import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Particles 2.15

Rectangle {

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
            onClicked: emitter.burst()
        }
    }

    ParticleSystem {
        id: confetti
        running: true

        Emitter {
            id: emitter
            anchors.fill: parent
            emitRate: 0
            lifeSpan: 1200
            lifeSpanVariation: 100
            size: 30
            endSize: 50 
            velocity: AngleDirection {
                angle: 90
                angleVariation: 360
                magnitude: 100
                magnitudeVariation: 80
            }
            
            function burst() {
                emitter.emitRate = 100;
                console.log('.')
                Qt.callLater(function() { 
                console.log(",")
                emitter.emitRate = 0;
                 }, 5000)
            }
        }

        ImageParticle {
            source: "qrc:/images/confetti.png"
            alpha: 1.0

            Behavior on alpha {
                NumberAnimation {
                    from: 1.0
                    to: 0.0
                    duration: 1200
                }
            }
        }
    }
}
