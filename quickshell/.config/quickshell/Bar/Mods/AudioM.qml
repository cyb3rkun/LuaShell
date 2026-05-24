import QtQuick
import Quickshell
// import Quickshell.Widgets
import Quickshell.Services.Pipewire
import qs.Singletons
import qs.Shapes
import qs.Components

ChamferRect {
	id: audioMod
	height: 20
	width: volContent.width + 14
	fillColor: Colors.colors.bg.inactive
	chamfer: 4

	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
	}

	Row {
		id: volContent
		anchors.centerIn: parent
		spacing: 8

		// ── Speaker ──────────────────────────────
		Row {
			spacing: 4
			AText {
				anchors.verticalCenter: parent.verticalCenter
				text: {
					const sink = Pipewire.defaultAudioSink;
					if (!sink || !sink.audio || sink.audio.muted || sink.audio.volume <= 0)
					return "\udb81\udd81"; // 󰖁
					if (sink.audio.volume < 0.33)
					return "\udb81\udd7f"; // 󰕿
					if (sink.audio.volume < 0.66)
					return "\udb81\udd80"; // 󰖀
					return "\udb81\udd7e";      // 󰕾
				}
				color: {
					const sink = Pipewire.defaultAudioSink;
					if (!sink || !sink.audio || sink.audio.muted)
					return Colors.colors.text.inactive;
					return Colors.colors.general.P2;
				}
				font.pixelSize: 14

				MouseArea {
					anchors.fill: parent
					cursorShape: Qt.PointingHandCursor
					onClicked: {
						const sink = Pipewire.defaultAudioSink;
						if (sink && sink.audio)
						sink.audio.muted = !sink.audio.muted;
					}
				}
			}

			AText {
				anchors.verticalCenter: parent.verticalCenter
				text: {
					const sink = Pipewire.defaultAudioSink;
					if (!sink || !sink.audio)
					return "–";
					if (sink.audio.muted)
					return "Mute";
					return Math.round(sink.audio.volume * 100) + "%";
				}
				color: Colors.colors.text.P1
				font.pixelSize: 11

				MouseArea {
					anchors.fill: parent
					cursorShape: Qt.PointingHandCursor
					onWheel: wheel => {
						const sink = Pipewire.defaultAudioSink;
						if (!sink || !sink.audio)
						return;
						const delta = wheel.angleDelta.y > 0 ? 0.05 : -0.05;
						sink.audio.volume = Math.max(0, Math.min(1.5, sink.audio.volume + delta));
					}
				}
			}
		}

		// ── Divider ───────────────────────────────
		Rectangle {
			width: 2
			height: 20
			anchors.verticalCenter: parent.verticalCenter
			color: Colors.colors.general.active
			opacity: 0.5
		}

		// ── Mic ───────────────────────────────────
		Row {
			spacing: 4
			AText {
				anchors.verticalCenter: parent.verticalCenter
				text: {
					const src = Pipewire.defaultAudioSource;
					if (!src || !src.audio || src.audio.muted)
					return "\udb80\udf6d"; // 󰅧 muted mic
					return "\uec1c";     // 󰅢 active mic
				}
				color: {
					const src = Pipewire.defaultAudioSource;
					if (!src || !src.audio || src.audio.muted)
					return Colors.colors.text.inactive;
					return Colors.colors.general.P7; // reddish accent
				}
				font.pixelSize: 14

				MouseArea {
					anchors.fill: parent
					cursorShape: Qt.PointingHandCursor
					onClicked: {
						const src = Pipewire.defaultAudioSource;
						if (src && src.audio)
						src.audio.muted = !src.audio.muted;
					}
				}
			}

			AText {
				anchors.verticalCenter: parent.verticalCenter
				text: {
					const src = Pipewire.defaultAudioSource;
					if (!src || !src.audio)
					return "–";
					if (src.audio.muted)
					return "Mute";
					return Math.round(src.audio.volume * 100) + "%";
				}
				color: Colors.colors.text.P1
				font.pixelSize: 11

				MouseArea {
					anchors.fill: parent
					cursorShape: Qt.PointingHandCursor

					onWheel: wheel => {
						console.log("Input Wheel")
						const src = Pipewire.defaultAudioSource;
						if (!src || !src.audio)
						return;
						const delta = wheel.angleDelta.y > 0 ? 0.05 : -0.05;
						src.audio.volume = Math.max(0, Math.min(1.0, src.audio.volume + delta));
					}
				}
			}
		}
	}
}
