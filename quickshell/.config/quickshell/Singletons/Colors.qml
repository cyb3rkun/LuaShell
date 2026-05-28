pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var colors: ({})
    property bool loaded: false

    FileView {
        id: colorFile
        path: Quickshell.env("HOME") + "/.config/lua-shell/colors.json"
        watchChanges: true
        onTextChanged: {
            try {
                root.colors = JSON.parse(colorFile.text());
                root.loaded = true;
                console.log("Colors loaded OK");
            } catch (e) {
                console.log("Colors parse error:", e);
            }
        }
    }

    function rgba(hex) {
        if (!hex) return "#ffffff"
        if (hex.length === 9)
            return "#" + hex.slice(7, 9) + hex.slice(1, 7)
        return hex
    }
}
