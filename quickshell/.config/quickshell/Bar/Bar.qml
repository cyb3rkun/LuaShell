import Quickshell // for PanelWindow
import QtQuick // for Text
import Quickshell.Io
import qs.Singletons
import "Mods"

Scope {
	id: root
	property string time
	// import time

	Variants {
		model: Quickshell.screens

		PanelWindow {
			id: panelBar
			required property var modelData
			screen: modelData

			// color: "#66000000"
			color: "#00000000"
			// color: Colors.rgba("#00000066")

			// Rectangle {
			// 	anchors.bottom: parent.bottom
			// 	anchors.left: parent.left
			// 	anchors.right: parent.right
			// 	height :1
			// 	color: "#6587b9"
			// }
			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 30

			// Left Anchor
			Row {
				anchors.verticalCenter: parent.verticalCenter
				anchors.leftMargin: 10
				anchors.left: parent.left
				spacing: 10
				WorkspaceMod {
					targetScreen: panelBar.modelData
				}
			}
			// Center Anchor
			Row {
				anchors.centerIn: parent
				anchors.verticalCenter: parent.verticalCenter
				ClockMod {}
			}
			// Right Anchor
			Row {
				anchors.right: parent.right
				anchors.rightMargin: 10
				anchors.verticalCenter: parent.verticalCenter
				spacing: 10
				Text {
					text: "Hello World"
					color: "white"
					height: 30
				}
			}
		}
	}
}
