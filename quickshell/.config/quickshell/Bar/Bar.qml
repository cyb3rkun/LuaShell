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

			// color: Colors.rgba("#000000AA")
			color: "transparent"

			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: Vars.barHeight

			// Left Anchor
			Row {
				id: lAnchor
				anchors.verticalCenter: parent.verticalCenter
				anchors.leftMargin: 10
				anchors.left: parent.left
				spacing: Vars.spacing
				WorkspaceMod {
					targetScreen: panelBar.modelData
				}
				TipMod {
					// targetScreen: panelBar.modelData
					// parentWindow: panelBar
				}
			}

			Row {
				id: cLAnchor
				spacing: 6
				anchors.right: cAnchor.left
				anchors.verticalCenter: parent.verticalCenter
				anchors.rightMargin: 8

				// Custom LuaShell System Tray menu
				// NOTE: Need to use Custom_systtray_popupMenu branch
				// for this to work
				// Stray {
				// 	anchors.verticalCenter: parent.verticalCenter
				// 	// anchors.left: parent.left
				// 	pwindow: panelBar
				// }
				AudioMod {}
			}

			Row {
				id: cAnchor
				anchors.centerIn: parent
				anchors.verticalCenter: parent.verticalCenter

				ClockMod {}
			}

			Row {
				id: cRAnchor
				spacing: 8
				anchors.left: cAnchor.right
				anchors.verticalCenter: parent.verticalCenter
				anchors.leftMargin: 8

				// PlatformMenu
				// AudioMod is more complex and uses system Icon theme
				// for icons
				SysTray {

					anchors.verticalCenter: parent.verticalCenter
				}

				// AudioM is simpler and uses nerd font symbols for icons
				// AudioM {}
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
