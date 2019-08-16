import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "widgets" as Widgets

SplitView {
    anchors.fill: softContent
    handleDelegate: Rectangle {
        width: 2
        color: "#232323"
    }

    Widgets.UBlock {}

    Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: "#2c2e2f"
    }

    Widgets.UBlock {}
}
