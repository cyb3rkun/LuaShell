// ClockWidget.qml
import QtQuick
import qs.Singletons
import qs.Components

AText {
  text: Time.time
  color: Colors.rgba(Colors.colors.text.P1)
}
