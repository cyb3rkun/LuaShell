pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
	id: root

	property var colors: ({})

	Process {
		id: catProc
		command: ["cat", Quickshell.env("HOME") + "/.config/lua-shell/colors.json"]
		running: true
		stdout: SplitParser {
			splitMarker: ""  // read all at once, not line by line
			onRead: data => {
				try {
					root.colors = JSON.parse(data);
					console.log("Colors loaded OK");
				} catch (e) {
					console.log("Parse error:", e, "\nData was:", data);
				}
			}
		}
	}
	FileView {
		path: Quickshell.env("HOME") + "/.config/lua-shell/colors.json"
		watchChanges: true
		onFileChanged: catProc.running = true
	}

    function rgba(hex) {
        if (!hex) return "#ffffff"
        if (hex.length === 9)  // #RRGGBBAA → #AARRGGBB
            return "#" + hex.slice(7, 9) + hex.slice(1, 7)
        return hex
    }
}
