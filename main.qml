import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "content"
import "content/widgets" as Widgets

FramelessWindow {
    id: mainWindow
    visible: true
    width: 1440
    height: 800
    property bool maxWindow: false
    ColumnLayout {
        id: windowLayout
        anchors.fill: parent
        anchors.margins: padding
        spacing: 0
        Header {}
        Rectangle {
            id: content
            Layout.fillWidth: true
            Layout.fillHeight: true
            width: 100
            height: 30
            color: "#232323"
            StackView {
                anchors.fill: parent
            }
        }
        Footer {}
    }
}

//ApplicationWindow {
//    id:mainWindow
//    visible: true
//    width: 1440
//    height: 900
//    background: Rectangle {
//        border.width: 1
//        border.color: "#232323"
//        color: "#333536"
//    }

//    property bool maxWindow: false
//    header: Column {
//        width: parent.width
//        RowLayout {
//            width: parent.width
//            height: 30
//            spacing: 0
//            Rectangle {
//                id:logo
//                width: 30
//                height: 30
//                color: "#333536"
//                Layout.alignment: Qt.AlignVCenter
//            }
//            Rectangle {
//                height: parent.height
//                Layout.fillWidth: true
//                Layout.alignment: Qt.AlignVCenter
//                color: "#333536"
//                //鼠标拖动
//                MouseArea {
//                    anchors.fill: parent
//                    property point clickPoint: "0,0"
//                    onPressed: {
//                        clickPoint = Qt.point(mouse.x,mouse.y)
//                        console.log(clickPoint)
//                    }
//                    onPositionChanged: {
//                        //鼠标偏移量
//                        var delta =Qt.point(mouse.x-clickPoint.x, mouse.y-clickPoint.y)
//                        //如果mainwindow继承自QWidget,用setPos
//                        mainWindow.setX(mainWindow.x+delta.x)
//                        mainWindow.setY(mainWindow.y+delta.y)
//                    }
//                }
//            }

//            Rectangle {
//                id: changeStyle
//                height: parent.height
//                width: height
//                Layout.alignment: Qt.AlignVCenter
//                color: "#333536"
//                Widgets.UIconButton {
//                    width: 30
//                    height: 30
//                    icon.color: "#a5a5a5"
//                    icon.source: "content/images/icon_skin.svg"
//                    onClicked: {
//                        mainWindow.visibility = Window.Minimized
//                    }
//                }
//            }
//            Rectangle {
//                id: minimizeWindow
//                height: parent.height
//                width: height
//                Layout.alignment: Qt.AlignVCenter
//                color: "#333536"
//                Widgets.UIconButton {
//                    width: 30
//                    height: 30
//                    icon.color: "#a5a5a5"
//                    icon.source: "content/images/icon_minimize.svg"
//                    onClicked: {
//                        mainWindow.visibility = Window.Minimized
//                    }
//                }
//            }
//            Rectangle {
//                id: maximizeWindow
//                visible: !mainWindow.maxWindow
//                height: parent.height
//                width: height
//                Layout.alignment: Qt.AlignVCenter
//                color: "#333536"
//                Widgets.UIconButton {
//                    width: 30
//                    height: 30
//                    icon.color: "#a5a5a5"
//                    icon.source: "content/images/icon_maximize.svg"
//                    onClicked: {
//                        mainWindow.visibility = Window.Maximized
//                        mainWindow.maxWindow = !mainWindow.maxWindow
//                    }
//                }
//            }
//            Rectangle {
//                id: restoreWindow
//                visible: mainWindow.maxWindow
//                height: parent.height
//                width: height
//                Layout.alignment: Qt.AlignVCenter
//                color: "#333536"
//                Widgets.UIconButton {
//                    width: 30
//                    height: 30
//                    icon.color: "#a5a5a5"
//                    icon.source: "content/images/icon_restore.svg"
//                    onClicked: {
//                        mainWindow.visibility = Window.Windowed
//                        mainWindow.maxWindow = !mainWindow.maxWindow
//                    }
//                }
//            }
//            Rectangle {
//                id: closeWindow
//                height: parent.height
//                width: height
//                Layout.alignment: Qt.AlignVCenter
//                color: "#333536" //rbg51,53,54
//                Widgets.UIconButton {
//                    width: 30
//                    height: 30
//                    icon.color: "#a5a5a5"
//                    icon.source: "content/images/icon_close.svg"
//                    hoverColor: "#99352e"
//                    activerColor: "#7f2c26"
//                    onClicked: {
//                        Qt.quit()
//                    }
//                }
//            }
//        }
//    }

//    footer: Rectangle {
//        width: 60
//        height: 60
//        color: "#ff6600"
//        MouseArea {
//            anchors.fill: parent
//            property point clickPoint: "0,0"
//            onPressed: {
//                clickPoint = Qt.point(mouse.x,mouse.y)
//                console.log(clickPoint)
//            }
//            onPositionChanged: {
//                //鼠标偏移量
//                var delta =Qt.point(mouse.x-clickPoint.x, mouse.y-clickPoint.y)
//                //如果mainwindow继承自QWidget,用setPos
//                mainWindow.setWidth(mainWindow.y+delta.y)
//                mainWindow.setY(mainWindow.y+delta.y)
//            }
//        }
//    }

//    Timer {
//        interval: 1
//        running: true
//        onTriggered: mainWindow.flags = Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.WindowMinimizeButtonHint | Qt.Window
//    }
//}
