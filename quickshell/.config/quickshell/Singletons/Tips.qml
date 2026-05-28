pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
	id: root

	property var tips: []
	property var currentTip: ({
		pretext: "",
		content: ""
	})

	function nextTip() {
		if (tips.length === 0)
		return;
		currentTip = tips[Math.floor(Math.random() * tips.length)];
	}

	Process {
		id: catProc
		command: ["cat", Quickshell.env("HOME") + "/.config/lua-shell/lua-tips.json"]
		running: true
		stdout: SplitParser {
			splitMarker: ""
			onRead: data => {
				try {
					root.tips = JSON.parse(data);
					root.nextTip();
					console.log("Tips loaded OK:", root.tips.length, "tips");
				} catch (e) {
					console.log("Tips parse error:", e);
				}
			}
		}
	}

	FileView {
		path: Quickshell.env("HOME") + "/.config/lua-shell/lua-tips.json"
		watchChanges: true
		onFileChanged: catProc.running = true
	}
}
