import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.Singletons
import qs.Components
import qs.Shapes

PopupWindow {
    id: root
    required property var trigger
    property SystemTrayItem trayItem: null

    anchor.item: trigger
    anchor.edges: Edges.Bottom | Edges.Left
    color: "transparent"
    grabFocus: true
    visible: false

    width: 220
    height: menuItemsColumn.implicitHeight + 24

    QsMenuOpener {
        id: opener
        menu: root.trayItem?.menu ?? null
    }

    ChamferRect {
        anchors.fill: parent
		fillColor: Colors.rgba("#000000AA")
		showBorder: true
		borderWidth: 2
		borderColor: Colors.rgba("#6587b9")
        // color: Colors.rgba("#000000cc")
        // radius: 10
        // border.color: "#313244"
        // border.width: 1

        Column {
            id: menuItemsColumn
            width: 204
            anchors.centerIn: parent
            spacing: 6

            Text {
                text: "No context menu available"
                color: "#585b70"
                font.pixelSize: 13
                visible: opener.children.count === 0
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }

            Repeater {
                model: opener.children

                delegate: MouseArea {
                    id: rowClickTarget
                    required property QsMenuEntry modelData

                    width: 204
                    height: modelData.isSeparator ? 5 : 32
                    hoverEnabled: true

                    Rectangle {
                        anchors.fill: parent
                        color: rowClickTarget.containsMouse ? "#6587b9" : "transparent"
                        radius: 6

                        // Separator
                        Rectangle {
                            visible: modelData.isSeparator
                            width: parent.width - 16
                            height: 1
                            color: "#6587b9"
                            opacity: 0.4
                            anchors.centerIn: parent
                        }

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            spacing: 8
                            visible: !modelData.isSeparator

                            // Checkbox / radio indicator
                            Text {
                                visible: modelData.buttonType !== QsMenuButtonType.None
                                text: {
                                    if (modelData.buttonType === QsMenuButtonType.CheckBox)
                                        return modelData.checkState === Qt.Checked ? "\uf14a" : "\uf0c8"
                                    if (modelData.buttonType === QsMenuButtonType.RadioButton)
                                        return modelData.checkState === Qt.Checked ? "\uf192" : "\uf10c"
                                    return ""
                                }
                                color: "white"
                                font.family: "JetBrainsMono Nerd Font"
                                font.pixelSize: 14
                                Layout.preferredWidth: 18
                            }

                            // App-provided icon
                            Image {
                                visible: modelData.icon !== "" && modelData.buttonType === QsMenuButtonType.None
                                source: modelData.icon
                                sourceSize.width: 16
                                sourceSize.height: 16
                                Layout.preferredWidth: 16
                                Layout.preferredHeight: 16
                            }

                            // Spacer when no icon and no checkbox
                            Item {
                                visible: modelData.icon === "" && modelData.buttonType === QsMenuButtonType.None
                                Layout.preferredWidth: 16
                            }

                            Text {
                                text: modelData.text ?? "Item"
                                color: modelData.enabled ? "white" : "#585b70"
                                Layout.fillWidth: true
                                font.pixelSize: 13
                                elide: Text.ElideRight
                            }

                            // Submenu arrow
                            Text {
                                visible: modelData.hasChildren
                                text: "\uf054"
                                color: "#585b70"
                                font.family: "JetBrainsMono Nerd Font"
                                font.pixelSize: 11
                            }
                        }
                    }

                    onClicked: {
                        if (modelData.enabled && !modelData.isSeparator) {
                            modelData.triggered()
                            root.visible = false
                        }
                    }
                }
            }
        }
    }
}
