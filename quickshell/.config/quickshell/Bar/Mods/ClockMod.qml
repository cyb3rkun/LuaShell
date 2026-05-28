// ClockWidget.qml
import QtQuick
import qs.Singletons
import qs.Components
import qs.Shapes

Item {
	// You need to set the width/height of the Item so the Row knows how to space it
	implicitWidth: bubble.width
	implicitHeight: bubble.height
	visible: Colors.loaded


	ChamferRect {
		id: bubble
		// This height will now define the container height
		height: Vars.widgitHeight
		width: timeText.implicitWidth + 16 // Add padding for the chamfers
		chamfer: 4
		fillColor: Colors.loaded ? Colors.rgba(Colors.colors.bg.P2) : "transparent"
		anchors.centerIn: parent
		visible: Colors.loaded

		AText {
			id: timeText
			anchors.centerIn: parent
			text: Time.time
			font.bold: true
			color: Colors.rgba(Colors.colors.text.P1)
		}
	}
}
