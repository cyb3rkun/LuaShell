import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.Singletons
import qs.Components

Item {
	id: root
	required property PanelWindow pwindow
	implicitHeight: 20
	implicitWidth: 20

	StrayPopup {
		id: popup
		trigger: root
	}

	Row {
		id: trayIcons
		anchors.centerIn: parent
		spacing: 8

		Repeater {
			id: trayItems

			model: SystemTray.items

			MouseArea {
				id: trayDelegate

				required property SystemTrayItem modelData

				width: trayItem.implicitSize
				height: trayItem.implicitSize

				IconImage {
					id: trayItem
					anchors.centerIn: parent
					source: trayDelegate.modelData.icon
					implicitSize: 16
				}

				acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

				onClicked: mouse => {
					console.log(modelData.hasMenu)
					console.log(modelData.menu)
					popup.trigger = trayDelegate;
					popup.trayItem = modelData;
					popup.visible = !popup.visible;
				}
			}
		}
	}
}
