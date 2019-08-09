import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3

Button {
    id: control

    property color normalColor: "#333536"
    property color hoverColor: "#282a2c"
    property color activerColor: "#1c1c1c"
    property color labelColor: "#a5a5a5"
    property string source
    property int marginWidth: 4
    property int marginHeight: 4
    property int iconHeight: image.height
    property int iconWidth: image.width
    property int labelSize: label.font.pixelSize
    width: image.width +label.width + marginWidth * 4
    height: Math.max(image.height, label.height) + marginHeight * 2
    padding: 0
    contentItem: Item {
        Image {
            id: image
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: control.marginWidth
            width: control.iconWidth ? control.iconWidth : 16
            height: control.iconHeight ? control.iconHeight : 16
            source: control.source
            antialiasing: true
        }
        Label {
            id:label
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: image.right
            anchors.leftMargin: control.marginWidth
            text: control.text ? control.text : "Button"
            font.family: "Microsoft yahei"
            font.weight: Font.Normal
            font.pixelSize: control.labelSize ? control.labelSize : 12
            color: control.labelColor //165 165 165
        }
    }

    background: Rectangle {
        implicitWidth: control.width
        implicitHeight: control.height
        color: {
            if(parent.hovered){
                if(parent.down) {
                    activerColor
                } else {
                    hoverColor
                }
            } else {
                normalColor
            }
        }
    }

}
