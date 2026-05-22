import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import qs.Singletons
import qs.Components

Item {
	id: root

	implicitWidth: icon_image.implicitWidth + 16
	implicitHeight: 30

	Image {
		id: icon_image
		source: "/home/cyb3r/LuaShell/assets/LuaShell-PMenuIcon.svg"
		width: 16
		height: 16
		anchors.right: parent.right
		anchors.verticalCenter: parent.verticalCenter

		Process {
			id: wlogoutProc
			command: [
				"wlogout",
				"-b",
				"5",
				"-T",
				"400",
				"-B",
				"400",
				"-L",
				"300",
				"-R",
				"300"
			]
		}

		MouseArea {
			anchors.fill: parent
			cursorShape: Qt.PointingHandCursor
			onClicked: wlogoutProc.running = true
		}
	}



}
