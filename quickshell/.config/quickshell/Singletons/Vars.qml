pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
	id: root
	readonly property real barHeight: 34
	readonly property real widgitHeight: 24
	readonly property real implicitWidgitHeight: 20
	readonly property real spacing: 8
	readonly property real smallSpacing: 4
	readonly property real medSpacing: 10
	readonly property real largeSpacing: 16
}
