# Custom Animated QML Buttons

This repository contains a collection of custom animated buttons designed for Qt QML. These buttons are designed to enhance the user interface with various animation effects upon interactions like hovering, clicking, etc.

![](https://github.com/itz-arnav/CustomQMLButtons/blob/main/proj.gif)

https://www.youtube.com/watch?v=wKdwar_BcPQ&ab_channel=ArnabJha


## Prerequisites

Ensure you have the following installed:
- [Qt](https://www.qt.io/download) (6.5.1 or later recommended) (Ensure to have Qt5 Compat Modules also installed)
- [Qt Creator](https://www.qt.io/product/development-tools) for easy project management and UI design

## How to Use

To use these buttons in your QML application, follow these steps:

1. **Clone the Repository:**
   Clone this repository to your local machine or download the files directly.

   ```bash
   git clone https://your-repository-link.git
   ```

2. **Include the Button Files:**
	Ensure that the QML files for the buttons are correctly placed in your project's directory and are accessible within your QML context.

3.	**Use the Buttons in Your Project:**
	You can instantiate any of the custom buttons directly in your QML files. Below are examples of how to integrate these buttons into your application. Ensure that each button component file is imported if they are not in the same directory.
	
## Example Usage

**CustomButton**


        CustomButton {
			buttonText: "Plain Button"
			onButtonClicked: console.log("Plain Button Clicked!")
		}

**PulsingButton**

		PulsingButton {
			buttonText: "Pulsing Button"
			onButtonClicked: console.log("Pulsing Button Clicked!")
		}


## Customization

Each button can be customized with different properties such as buttonText, color, radius, and more, depending on the design of the button. Refer to the documentation within each button's QML file for more details on what properties can be customized.
