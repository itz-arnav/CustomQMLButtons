import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Particles 2.15

Rectangle {
    anchors.fill: parent

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
            onClicked: confetti.start()
        }
    }

    ParticleSystem {
        id: confetti
        running: false  // Start off not running

        Emitter {
            anchors.fill: parent
            emitRate: 10
            lifeSpan: 800
            lifeSpanVariation: 100
            size: 30
            endSize: 50 
            velocity: AngleDirection {
                angle: 90
                angleVariation: 360
                magnitude: 100
                magnitudeVariation: 50
            }
        }

        ImageParticle {
            source: "qrc:/images/confetti.png"
            alpha: 1.0  // Full opacity initially

            Behavior on alpha {
                NumberAnimation {
                    from: 1.0
                    to: 0.0  // Fade to transparent
                    duration: 800  // Match the lifespan of the particle
                }
            }
        }
    }
}
