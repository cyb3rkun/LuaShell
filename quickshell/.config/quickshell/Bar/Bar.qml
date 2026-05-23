import Quickshell // for PanelWindow
import QtQuick // for Text
import Quickshell.Io
import qs.Singletons
import qs.Components
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

			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 28

			// Left Anchor
			Row {
				id: lAnchor
				anchors.verticalCenter: parent.verticalCenter
				anchors.leftMargin: 10
				anchors.left: parent.left
				spacing: 10
				WorkspaceMod {
					targetScreen: panelBar.modelData
				}
				TipMod {
					targetScreen: panelBar.modelData
					parentWindow: panelBar
				}
			}
			Row {
				id: cAnchor
				anchors.centerIn: parent
				anchors.verticalCenter: parent.verticalCenter
				ClockMod {}
			}

			Row {
				id: cRAnchor
				anchors.left: cAnchor.right
				anchors.verticalCenter: parent.verticalCenter
				anchors.leftMargin: 10

				SysTray {
					anchors.verticalCenter: parent.verticalCenter
					anchors.left: parent.left
					// parentWindow: root.parentWindow
				}
			}
			Row {
				id: cLAnchor
				anchors.right: cAnchor.left
				anchors.verticalCenter: parent.verticalCenter
				anchors.rightMargin: 10

				AText {
					text: "Hello World"
					color: "white"
				}
			}

			// Right Anchor
			Row {
				id: rAnchor
				anchors.right: parent.right
				anchors.rightMargin: 10
				anchors.verticalCenter: parent.verticalCenter

				spacing: 10

				PowerButton {}
			}
		}
	}
}
