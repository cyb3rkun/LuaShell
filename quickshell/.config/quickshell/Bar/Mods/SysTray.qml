import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.Singletons
import qs.Shapes
import qs.Components

// TODO: Resize ChamferRect dynamically when removing items to
// fix warping corners
ChamferRect {
	implicitHeight: Vars.widgitHeight
	width: trayIcons.implicitWidth + 14
	fillColor: Colors.colors.bg.inactive
	chamfer: 4

	RowLayout {
		id: trayIcons
		anchors.centerIn: parent
		spacing: 8

		Repeater {
			model: SystemTray.items

			MouseArea {
				id: trayDelegate

				required property SystemTrayItem modelData

				Layout.preferredWidth: 14
				Layout.preferredHeight: 14

				acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

				onClicked: mouse => {
					console.log("Clicked Systray Icon");
					if (mouse.button === Qt.LeftButton) {
						modelData.activate();
					} else if (mouse.button === Qt.RightButton) {
						if (modelData.hasMenu) {
							menuAnchor.open();
						}
					} else if (mouse.button === Qt.MiddleButton) {
						modelData.secondaryActivate();
					}
				}
				IconImage {
					anchors.centerIn: parent
					source: trayDelegate.modelData.icon
					implicitSize: 16
				}

				QsMenuAnchor {
					id: menuAnchor
					menu: trayDelegate.modelData.menu

					anchor.window: trayDelegate.QsWindow.window
					anchor.adjustment: PopupAdjustment.Flip
					anchor.onAnchoring: {
						const window = trayDelegate.QsWindow.window;
						const widgetRect = window.contentItem.mapFromItem(trayDelegate, 0, trayDelegate.height, trayDelegate.width, trayDelegate.height);
						menuAnchor.anchor.rect = widgetRect;
					}
				}
			}
		}
	}
}
