import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.Singletons
import qs.Shapes

PopupWindow {
	id: popup

	property string content: ""
	// required property var anchorWindow

	visible: false
	// color: Colors.rgba("#000000CC")
	color: "transparent"

	ChamferRect {
		width: popup.width
		height: popup.height
		fillColor: Colors.rgba("#222b39AA")
		chamfer: 8

	}
	anchor.window: anchorWindow
	anchor.rect.x: 0
	anchor.rect.y: anchor.window ? anchor.window.height : 0

	implicitWidth: Math.min(contentText.implicitWidth + 24, 250)
	implicitHeight: contentText.implicitHeight + 24

	Timer {
		id: hideTimer
		interval: 10000
		running: false
		repeat: false
		onTriggered: popup.visible = false
	}

	MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		onEntered: hideTimer.stop()
		onExited: hideTimer.restart()

		Text {
			id: contentText
			anchors.centerIn: parent
			width: popup.width - 24
			text: popup.content
			color: "white"
			wrapMode: Text.WordWrap
			font.pixelSize: 13
		}
	}

	function show() {
		visible = true;
		hideTimer.restart();
	}
}
