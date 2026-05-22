import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes
import qs.Singletons
import qs.Shapes
import qs.Components

Item {
	width: contentRow.implicitWidth 
	height: 30

	property var targetScreen: null
	readonly property var hyprMonitor: targetScreen ? Hyprland.monitorFor(targetScreen) : null
	readonly property var monitorWorkspaces: {
		if (!Hyprland.workspaces || !hyprMonitor)
		return [];
		return Hyprland.workspaces.values.filter(w => w.monitor && w.monitor.name === hyprMonitor.name).sort((a, b) => a.id - b.id);
	}

	// ChamferRect {
	// 	anchors.fill: parent
	// 	chamfer: 15
	// 	fillColor: Colors.rgba("#FFFFFF0F")
	// }

	Row {
		id: contentRow
		spacing: 8
		anchors.centerIn: parent

		Repeater {
			model: monitorWorkspaces
			delegate: Item {
				required property var modelData
				readonly property var ws: modelData

				// Fix 1: Bind directly to the properties so QML tracks changes actively
				readonly property bool isActive: ws.focused

				// Fix 2: Explicitly alias the count property to force evaluation updates
				readonly property int windowCount: ws.toplevels.values.length
				readonly property bool isOccupied: windowCount > 0
				// Component.onCompleted: {
				// 	console.log("WS", ws.id, "toplevels:", ws.toplevels, "values:", ws.toplevels.values, "values.length:", ws.toplevels.values.length);
				// }

				width: bubble.width
				height: bubble.height

				ChamferRect {
					id: bubble
					width: isActive ? 50: Math.max(28, wsLabel.implicitWidth + 12)
					height: 20
					chamfer: 4

					fillColor: {
						if (isActive)
						return Colors.rgba(Colors.colors.bg.focused);
						else if (isOccupied)
						return Colors.rgba(Colors.colors.bg.occupied);
						else
						return Colors.rgba(Colors.colors.bg.inactive);
					}

					// NOTE: uncomment the block below to show workspace
					// numbers
					AText {
						id: wsLabel
						anchors.centerIn: parent
						text: ws.name.replace(/^[^:]+:/, "")
						font.bold: true
						horizontalAlignment: Text.AlignHCenter
						verticalAlignment: Text.AlignVCenter
						anchors.horizontalCenter: parent.horizontalCenter
						anchors.verticalCenter: parent.verticalCenter
						anchors.horizontalCenterOffset: 0
						anchors.verticalCenterOffset: 1
						color: {
							if (isActive)
							return Colors.rgba(Colors.colors?.text?.focused);
							else if (isOccupied)
							return Colors.rgba(Colors.colors?.text?.occupied);
							else
							return Colors.rgba(Colors.colors?.text?.inactive);
						}
					}

					MouseArea {
						anchors.fill: parent
						onClicked: ws.activate()
					}
				}
			}
		}
	}
}
