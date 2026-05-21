import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.Singletons

PopupWindow {
    id: popup

    property string content: ""
    property var anchorWindow: null

    visible: false
    color: "#CC111122"

    anchor.window: anchorWindow
    anchor.rect.x: 0
    anchor.rect.y: anchorWindow ? anchorWindow.height : 0

    implicitWidth: contentText.implicitWidth  
    implicitHeight: contentText.implicitHeight + 24

    Timer {
        id: hideTimer
        interval: 10000
        running: false
        repeat: false
        onTriggered: popup.visible = false
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: hideTimer.stop()
        onExited: hideTimer.restart()

        Text {
            id: contentText
            anchors.centerIn: parent
            width: popup.width - 24
            text: popup.content
            color: "white"
            wrapMode: Text.WordWrap
            font.pixelSize: 13
        }
    }

    function show() {
        visible = true
        hideTimer.restart()
    }
}
