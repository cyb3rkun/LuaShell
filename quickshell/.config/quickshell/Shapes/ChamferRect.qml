import QtQuick
import QtQuick.Shapes
import qs.Singletons

Shape {
    id: root
    property real chamfer: 15
    property color fillColor: Colors.rgba("#FFFFFF0F")
    property color strokeColor: "transparent"
    property real strokeWidth: 0

    // Border properties (off by default)
    property bool showBorder: false
    property color borderColor: "#313244"
    property real borderWidth: 1

    layer.enabled: true
    layer.samples: 4

    // Fill path
    ShapePath {
        strokeWidth: 0
        strokeColor: "transparent"
        fillColor: root.fillColor
        startX: root.chamfer; startY: 0
        PathLine { x: root.width - root.chamfer; y: 0 }
        PathLine { x: root.width;                y: root.chamfer }
        PathLine { x: root.width;                y: root.height - root.chamfer }
        PathLine { x: root.width - root.chamfer; y: root.height }
        PathLine { x: root.chamfer;              y: root.height }
        PathLine { x: 0;                         y: root.height - root.chamfer }
        PathLine { x: 0;                         y: root.chamfer }
        PathLine { x: root.chamfer;              y: 0 }
    }

    // Border path (separate so stroke doesn't bleed inside fill)
    ShapePath {
        strokeWidth: root.showBorder ? root.borderWidth : 0
        strokeColor: root.showBorder ? root.borderColor : "transparent"
        fillColor: "transparent"
        startX: root.chamfer; startY: 0
        PathLine { x: root.width - root.chamfer; y: 0 }
        PathLine { x: root.width;                y: root.chamfer }
        PathLine { x: root.width;                y: root.height - root.chamfer }
        PathLine { x: root.width - root.chamfer; y: root.height }
        PathLine { x: root.chamfer;              y: root.height }
        PathLine { x: 0;                         y: root.height - root.chamfer }
        PathLine { x: 0;                         y: root.chamfer }
        PathLine { x: root.chamfer;              y: 0 }
    }
}
