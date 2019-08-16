import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Rectangle {
    width: 240
    Layout.minimumWidth: 100
    Layout.preferredWidth: 240
    Layout.maximumWidth: 350
    Layout.fillHeight: true
    color: "#333536"
    RowLayout {
        spacing: 0
        anchors.fill: parent
        Rectangle {
            width: 24
            Layout.fillHeight: true
            Rectangle {
                id: leftTabTopLime
                width: parent.width
                height: 2
                color: "#232323"
                anchors.top: parent.top
            }
            Rectangle {
                width: parent.width
                anchors.top: leftTabTopLime.bottom
                anchors.bottom: leftTabBottomLime.top
                color: "#2c2e2f"
            }

            Rectangle {
                id: leftTabBottomLime
                width: parent.width
                height: 2
                color: "#232323"
                anchors.bottom: parent.bottom
            }
            Rectangle {
                width: 1
                height: parent.height
                color: "#232323"
                anchors.right: parent.right
            }
        }
        Rectangle {
            id: leftTabContent
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "#333536"
            Rectangle {
                id: leftTabContentTitle
                width: parent.width
                height: 27
                color: "#2c2e2f"
                Label {
                    text: qsTr("工作区")
                    font.pixelSize: 12
                    font.family: "Microsoft yahei"
                    color: "#9b9b9b"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                UIconButton {
                    id: hideLeftTabContent
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    source: "/content/images/icon_toleft.svg"
                    normalColor: "#2c2e2f"
                }
                Rectangle {
                    width: parent.width
                    height: 2
                    color: "#232323"
                    anchors.top: parent.top
                }
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#232323"
                    anchors.bottom: parent.bottom
                }
            }
            ScrollView {
                width: parent.width
                anchors.top: leftTabContentTitle.bottom
                anchors.bottom: leftTabContentBottomLine.top
            }

            Rectangle {
                id: leftTabContentBottomLine
                width: parent.width
                height: 1
                color: "#232323"
                anchors.bottom: parent.bottom
            }
        }
    }
}
