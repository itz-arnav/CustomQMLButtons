import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Window {
    id: rootWindow
    width: 1000
    height: 800
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        color: "#353535"
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 60

        GridLayout {
            id: buttonGridContainer
            columns: 2
            rowSpacing: 60
            columnSpacing: 100

            CustomButton {
                buttonText: "Plain Button"
                onButtonClicked: console.log("Plain Button Clicked!")
            }

            PulsingButton {
                buttonText: "Pulsing Button"
                onButtonClicked: console.log("Pulsing Button Clicked!")
            }

            SlideHoverButton {
                buttonText: "Slide Button"
                onButtonClicked: console.log("Slide Button Clicked!")
            }

            ConfettiButton {
                buttonText: "Confetti Button"
                onButtonClicked: console.log("Confetti Button Clicked!")
            }

            NeonButton {
                buttonText: "Neon Button"
                onButtonClicked: console.log("Neon Button Clicked!")
            }

            ExpandingBorderButton {
                buttonText: "Border Button"
                onButtonClicked: console.log("Border Button Clicked!")
            }
        }

        SubmitButton {
            buttonText: "Submit Button"
            onButtonClicked: console.log("Submit Button Clicked!")
            Layout.alignment: Qt.AlignHCenter
        }
    }
}