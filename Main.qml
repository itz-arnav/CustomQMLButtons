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
        rowSpacing: 20
        columnSpacing: 20
        
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
    }
}