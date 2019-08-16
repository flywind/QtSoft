import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Material.impl 2.2

ApplicationWindow {
    id: window
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"

    property real padding: window.visibility === Window.Maximized ? 0 : 20

    WindowAdjuster {
        anchors.fill: parent
        anchors.margins: window.padding - borderWidth / 2
        window: window
        enabled: window.padding > 0
    }

    background: Item {
        Rectangle {
            anchors.fill: parent
            anchors.margins: window.padding
            color: "#232323"//Material.backgroundColor // rgb 35 35 35"#232323"

            radius: 0

            layer.enabled: true
            layer.effect: ElevationEffect {
                elevation: 8
            }
        }
    }
}
