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
    width: Math.max(image.width + marginWidth * 2, label.width + marginWidth * 2)
    height: image.height + label.height + marginHeight * 2
    padding: 0
    contentItem: Item {
        Image {
            id: image
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: marginHeight
            width: control.iconWidth ? control.iconWidth : 24
            height: control.iconHeight ? control.iconHeight : 24
            source: control.source
            antialiasing: true
        }
        Label {
            id:label
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: image.bottom
            anchors.topMargin: marginHeight / 2
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
