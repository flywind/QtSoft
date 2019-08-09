import QtQuick 2.11
import QtQuick.Controls 2.4

TabButton {
    id: control
    property int marginWidth: 5
    property int marginHeight: 2
    property color normalColor: "#333536"
    property color labelColor: "#a5a5a5"
    property color activerColor: "#008ccf"
    property color activerLabelColor: "#ffffff"

    width: label.implicitWidth + marginWidth * 2
    height: label.implicitHeight + marginHeight * 2
    padding: 0
    contentItem: Label {
        id: label
        anchors.centerIn: control
        leftPadding: control.marginWidth
        rightPadding: control.marginWidth
        horizontalAlignment: Label.AlignHCenter
        verticalAlignment: Label.AlignVCenter
        font.family: "Microsoft yahei"
        font.pixelSize: 12
        text: control.text ? control.text : "TabButton"
        color: !control.focus ? control.labelColor : control.activerLabelColor
    }
    background: Rectangle {
        anchors.fill: parent
        radius: control.height / 2
        color: !control.focus ? control.normalColor : control.activerColor
    }
}
