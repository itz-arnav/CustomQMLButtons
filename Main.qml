import QtQuick
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    
    Rectangle{
        anchors.fill: parent
        color: "#353535"
    }
    
    GridLayout{
        anchors.centerIn: parent
        columns: 2
        rowSpacing: 30
        columnSpacing: 40
        
        CustomButton{
            onButtonClicked: {
                console.log("Plain Button Clicked!")
            }
        }
        
        PulsingButton{
            onButtonClicked: {
                console.log("Pulsing Button Clicked!")
            }
        }
        
        SlideHoverButton{
            onButtonClicked: {
                console.log("Button Clicked!")
            }
        }
        
        ConfettiButton{
            onButtonClicked: {
                console.log("Button Clicked!")
            }
        }
    }
}