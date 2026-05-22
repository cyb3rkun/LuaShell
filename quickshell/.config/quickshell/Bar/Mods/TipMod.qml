import QtQuick
import Quickshell
import qs.Singletons
import qs.Components

Item {
	id: root

	property var targetScreen: null
	property var parentWindow: null  // add this

	implicitWidth: pretextLabel.implicitWidth + 16
	implicitHeight: 30

	property var currentTip: ({
		pretext: "",
		content: ""
	})

	TipPopup {
		id: popup
		anchorWindow: root.parentWindow
		content: root.currentTip.content
	}

	AText {
		id: pretextLabel
		anchors.centerIn: parent
		text: root.currentTip.pretext || "Lua tip →"
		color: "white"
		font.pixelSize: 13

		MouseArea {
			anchors.fill: parent
			cursorShape: Qt.PointingHandCursor
			onClicked: {
				root.currentTip = Tips.randomTip();
				if (popup.visible) {
					popup.visible = false;
				} else {
					popup.show();
				}
			}
		}
	}

	Component.onCompleted: {
		root.currentTip = Tips.randomTip();
	}
}
