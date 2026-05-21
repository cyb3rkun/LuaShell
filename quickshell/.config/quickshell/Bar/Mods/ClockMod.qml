// ClockWidget.qml
import QtQuick
import qs.Singletons
import qs.Components
import qs.Shapes

Item {
	// You need to set the width/height of the Item so the Row knows how to space it
	width: bubble.width
	height: bubble.height

	ChamferRect {
		id: bubble
		// This height will now define the container height
		height: 20
		width: timeText.width + 16 // Add padding for the chamfers
		chamfer: 4
		fillColor: Colors.rgba(Colors.colors.bg.P2)
		anchors.centerIn: parent

		AText {
			id: timeText
			anchors.centerIn: parent
			text: Time.time
			font.bold: true
			color: Colors.rgba(Colors.colors.text.P1)
		}
	}
}
