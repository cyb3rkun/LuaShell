import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Services.Pipewire
import qs.Singletons
import qs.Shapes
import qs.Components

ChamferRect {
	id: audioMod
	height: 20
	width: deviceIcons.implicitWidth + 14
	fillColor: Colors.colors.bg.inactive
	chamfer: 4

	AudioPopup {}

	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
	}

	Process {
		id: audTriggerProcess
	}
	Row {
		id: deviceIcons
		anchors.centerIn: parent
		spacing: 6

		Item {
			anchors.verticalCenter: parent.verticalCenter
			width: micItem.implicitWidth + 4
			height: 20
			Row {
				id: micItem
				anchors.centerIn: parent
				spacing: 4
				AText {
					id: micText
					anchors.verticalCenter: parent.verticalCenter
					color: Colors.colors.general.P2
					visible: true
					font.pixelSize: 12
					font.bold: true
					text: {
						const sink = Pipewire.defaultAudioSource;
						if (!sink || !sink.audio)
						return "x";
						if (sink.audio.muted)
						return "M";
						return Math.round(sink.audio.volume * 100) + "%";
						return "X";
					}
				}
				IconImage {
					id: micIcon
					implicitSize: 16
					source: {
						const src = Pipewire.defaultAudioSource;
						if (!src || !src.audio || src.audio.muted)
						return "image://icon/audio-input-microphone-muted-symbolic";
						return "image://icon/audio-input-microphone-symbolic";
					}
					onStatusChanged: console.log("icon status:", status, source)
				}
			}
			MouseArea {
				id: inputMouseArea
				anchors.fill: parent

				acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
				onWheel: {
					console.log("Wheel Input");
					const src = Pipewire.defaultAudioSource;
					if (!src || !src.audio)
					return;
					const delta = wheel.angleDelta.y > 0 ? 0.05 : -0.05;
					src.audio.volume = Math.max(0, Math.min(1.5, src.audio.volume + delta));
				}
				onClicked: {
					const src = Pipewire.defaultAudioSource;
					if (mouse.button === Qt.RightButton) {
						console.log("Launching Volume Control Input Devices");
						audTriggerProcess.command = ["pavucontrol-qt", "--tab", "3"];
						audTriggerProcess.running = true;
					}
					if (mouse.button === Qt.LeftButton) {
						console.log("LeftButton Source")
						if (src && src.audio) {
							src.audio.muted = !src.audio.muted;
						}
					}
				}
			}
		}
		Rectangle {
			id: seperator
			anchors.verticalCenter: parent.verticalCenter
			color: Colors.colors.fg.occupied
			width: 1
			height: 16
		}

		Item {
			anchors.verticalCenter: parent.verticalCenter
			width: speakerItem.implicitWidth + 4
			height: 20
			Row {
				id: speakerItem
				anchors.centerIn: parent
				anchors.verticalCenter: parent.verticalCenter
				spacing: 4
				IconImage {
					// anchors.centerIn: parent
					implicitSize: 16
					source: {
						const sink = Pipewire.defaultAudioSink;
						if (!sink || !sink.audio || sink.audio.muted || sink.audio.volume <= 0)
						return "image://icon/audio-volume-muted-symbolic";
						if (sink.audio.volume < 0.33)
						return "image://icon/audio-volume-low-symbolic";
						if (sink.audio.volume < 0.66)
						return "image://icon/audio-volume-medium-symbolic";
						return "image://icon/audio-volume-high-symbolic";
					}
					onStatusChanged: console.log("icon status:", status, source)
				}
				AText {
					anchors.verticalCenter: parent.verticalCenter
					color: Colors.colors.general.S1
					visible: true
					font.pixelSize: 12
					font.bold: true
					text: {
						const sink = Pipewire.defaultAudioSink;
						if (!sink || !sink.audio)
						return "x";
						if (sink.audio.muted)
						return "M";
						return Math.round(sink.audio.volume * 100) + "%";
						return "X";
					}
				}
			}
			MouseArea {
				anchors.fill: parent
				acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
				onWheel: wheel => {
					console.log("Wheel Input");
					const sink = Pipewire.defaultAudioSink;
					if (!sink || !sink.audio)
					return;
					const delta = wheel.angleDelta.y > 0 ? 0.05 : -0.05;
					sink.audio.volume = Math.max(0, Math.min(1.5, sink.audio.volume + delta));
				}
				onClicked: {
					const sink = Pipewire.defaultAudioSink;
					if (mouse.button === Qt.RightButton) {
						audTriggerProcess.command = ["pavucontrol-qt", "--tab", "3"];
						audTriggerProcess.running = true;
					}
					if (mouse.button === Qt.LeftButton && (sink && sink.audio)) {
						sink.audio.muted = !sink.audio.muted;
					}
				}
			}
		}
	}

	AudioPopup {}
}
