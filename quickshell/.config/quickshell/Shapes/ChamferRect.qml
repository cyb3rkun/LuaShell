import QtQuick
import QtQuick.Shapes
import qs.Singletons

Shape {
    id: root

    property real chamfer: 15
    property color fillColor: Colors.rgba("#FFFFFF0F")
    property color strokeColor: "transparent"
    property real strokeWidth: 0

    layer.enabled: true
    layer.samples: 4

    ShapePath {
        strokeWidth: root.strokeWidth
        strokeColor: root.strokeColor
        fillColor: root.fillColor

        startX: root.chamfer
        startY: 0

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
