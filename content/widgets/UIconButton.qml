import QtQuick 2.11
import QtQuick.Controls 2.4

Button {
    id: control

    property color normalColor: "#333536"
    property color hoverColor: "#282a2c"
    property color activerColor: "#1c1c1c"
    property string source
    property int marginWidth: 4
    property int marginHeight: 4
    property int iconHeight: image.height
    property int iconWidth: image.width

    width: image.width + marginWidth * 2
    height: image.height + marginHeight * 2
    padding: 0
    contentItem: Item {
        Image {
            id: image
            anchors.centerIn: parent
            width: control.iconWidth ? control.iconWidth : 16
            height: control.iconHeight ? control.iconHeight : 16
            source: control.source
            fillMode: Image.PreserveAspectFit
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
