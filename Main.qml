import QtQuick
import QtQuick.Layouts

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")
    
    Rectangle{
        anchors.fill: parent
        color: "#353535"
    }
    
    GridLayout{
        anchors.centerIn: parent
        columns: 2
        rowSpacing: 50
        columnSpacing: 70
        
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
    }
}