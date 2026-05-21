// ClockWidget.qml
import QtQuick
import qs.Singletons

Text {
	// we no longer need time as an input

	// directly access the time property from the Time singleton
	font.family: "JetBrains Mono Nerd"
	anchors.verticalCenterOffset: 1
}
