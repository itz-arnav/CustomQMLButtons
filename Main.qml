import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Window {
    id: rootWindow
    width: 1000
    height: 800
    visible: true
    title: qsTr("Hello World")
    
    Rectangle{
        anchors.fill: parent
        color: "#353535"
    }
    
    Column{
        anchors.centerIn: parent
        spacing: 60


        GridLayout{
            id: buttonGridContainer

            columns: 2
            rowSpacing: 60
            columnSpacing: 100

            CustomButton{
                text: "Plain Button"
                onButtonClicked: {
                    console.log("Plain Button Clicked!")
                }
            }

            PulsingButton{
                text: "Pulsing Button"
                onButtonClicked: {
                    console.log("Pulsing Button Clicked!")
                }
            }

            SlideHoverButton{
                text: "Slide Button"

                onButtonClicked: {
                    console.log("Slide Button Clicked!")
                }
            }

            ConfettiButton{
                text: "Confetti Button"

                onButtonClicked: {
                    console.log("Confetti Button Clicked!")
                }
            }

            NeonButton{
                text: "Neon Button"
                onButtonClicked: {
                    console.log("Neon Button Clicked!")
                }
            }

            ExpandingBorderButton{
                text: "Border Button"
                onButtonClicked: {
                    console.log("Border Button Clicked!")
                }
            }
        }

        SubmitButton {
            text: "Submit Button"
            onButtonClicked: {
                console.log("Submit Button Clicked!")
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
