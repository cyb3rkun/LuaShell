import QtQuick
import Quickshell
// import Quickshell.Widgets
import Quickshell.Services.Pipewire
import qs.Singletons
import qs.Shapes
import qs.Components

PopupWindow {
	id: root
	visible: false

	property var modelData
	property var anchor
}
