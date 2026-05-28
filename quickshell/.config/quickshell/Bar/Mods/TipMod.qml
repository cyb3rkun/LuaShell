import QtQuick
import Quickshell
import qs.Singletons
import qs.Components

Item {
	id: root
	implicitWidth: pretextLabel.implicitWidth + 2
	implicitHeight: 30

	TipPopup {
		id: popup
		anchor.window: tipMouseArea.QsWindow.window
		content: Tips.currentTip.content
		anchor.rect.x: root.mapToGlobal(0, 0).x - anchor.window.contentItem.mapToGlobal(0, 0).x
		anchor.rect.y: root.mapToGlobal(0, 0).y - anchor.window.contentItem.mapToGlobal(0, 0).y + root.height
		anchor.rect.width: root.width
		anchor.rect.height: 0
	}

	AText {
		id: pretextLabel
		anchors.centerIn: parent
		text: Tips.currentTip.pretext || "Lua tip →"
		color: "white"
		font.pixelSize: 13
		MouseArea {
			id: tipMouseArea
			anchors.fill: parent
			cursorShape: Qt.PointingHandCursor
			onClicked: {
				Tips.nextTip();
				if (popup.visible) {
					popup.visible = false;
				} else {
					popup.show();
				}
			}
		}
	}
}
