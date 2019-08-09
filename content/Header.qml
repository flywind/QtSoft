import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Rectangle {
    id: header
    height: 132
    Layout.fillWidth: true
    color: "#333536"
    RowLayout {
        id:topStatusLayout
        width: parent.width
        height: 30
        anchors.left: parent.left
        anchors.top: parent.top
        spacing: 0
        Rectangle {
            id:logo
            width: 30
            height: 30
            color: "#333536"
            Layout.alignment: Qt.AlignVCenter
        }
        Rectangle {
            height: parent.height
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            color: "#333536"
            MouseArea {
                anchors.fill: parent
                property point clickPoint: "0,0"
                onPressed: {
                    clickPoint = Qt.point(mouse.x,mouse.y)
                    //console.log(clickPoint)
                }
                onPositionChanged: {
                    //鼠标偏移量
                    var delta =Qt.point(mouse.x-clickPoint.x, mouse.y-clickPoint.y)
                    //如果mainwindow继承自QWidget,用setPos
                    mainWindow.setX(mainWindow.x+delta.x)
                    mainWindow.setY(mainWindow.y+delta.y)
                }
            }
        }


        Rectangle {
            id: changeStyle
            height: parent.height
            width: changeStyleIcon.width
            Layout.alignment: Qt.AlignVCenter
            color: "#333536"
            Widgets.UIconButton {
                id: changeStyleIcon
                Layout.alignment: Qt.AlignTop
                source: "/content/images/icon_skin.svg"
            }
        }
        Rectangle {
            id: minimizeWindow
            height: parent.height
            width: minimizeWindowIcon.width
            Layout.alignment: Qt.AlignVCenter
            color: "#333536"
            Widgets.UIconButton {
                id: minimizeWindowIcon
                source: "/content/images/icon_minimize.svg"
                onClicked: {
                    mainWindow.visibility = Window.Minimized
                }
            }
        }
        Rectangle {
            id: maximizeWindow
            visible: !mainWindow.maxWindow
            height: parent.height
            width: maximizeWindowIcon.width
            Layout.alignment: Qt.AlignVCenter
            color: "#333536"
            Widgets.UIconButton {
                id: maximizeWindowIcon
                source: "/content/images/icon_maximize.svg"
                onClicked: {
                    mainWindow.visibility = Window.Maximized
                    mainWindow.maxWindow = !mainWindow.maxWindow
                }
            }
        }
        Rectangle {
            id: restoreWindow
            visible: mainWindow.maxWindow
            height: parent.height
            width: restoreWindowIcon.width
            Layout.alignment: Qt.AlignVCenter
            color: "#333536"
            Widgets.UIconButton {
                id: restoreWindowIcon
                source: "/content/images/icon_restore.svg"
                onClicked: {
                    mainWindow.visibility = Window.Windowed
                    mainWindow.maxWindow = !mainWindow.maxWindow
                }
            }
        }
        Rectangle {
            id: closeWindow
            height: parent.height
            width: closeWindowIcon.width
            color: "#333536" //rbg51,53,54333536
            Widgets.UIconButton {
                id: closeWindowIcon
                source: "/content/images/icon_close.svg"
                onClicked: {
                    Qt.quit()
                }
            }
        }
    }
    Rectangle {
        id: titleLine
        width: parent.width
        height: 1
        color: "#2b2d2e"
        anchors.left: parent.left
        anchors.top: topStatusLayout.bottom
    }
    Rectangle {
        id: menuBox
        width: parent.width
        height: 30
        color: "#333536"//333536
        anchors.left: parent.left
        anchors.top: titleLine.bottom
        RowLayout {
            id: topMenuLayout
            anchors.fill: parent
            spacing: 0
            Widgets.UIconTextButton {
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 10
                text: qsTr("文件")
                source: "/content/images/icon_more_16.svg"
            }
            Widgets.UIconButton {
                source: "/content/images/icon_next_page_16.svg"
                rotation: 90
                marginWidth: 0
                marginHeight: 0
            }
            Rectangle {
                width: 1
                height: 25
                Layout.leftMargin: 5
                Layout.rightMargin: 5
                color: "#464646"
            }
            Widgets.UIconButton {
                source: "/content/images/icon_new_project_16.svg"
            }
            Widgets.UIconButton {
                Layout.leftMargin: 2
                source: "/content/images/icon_open_project_16.svg"
            }
            Widgets.UIconButton {
                Layout.leftMargin: 2
                source: "/content/images/icon_close_project_16.svg"
            }
            Widgets.UIconButton {
                Layout.leftMargin: 2
                source: "/content/images/icon_save_16.svg"
            }
            TabBar {
                id: menuBar
                implicitHeight: 25
                Layout.leftMargin: 5
                background: Rectangle {
                    color: "transparent"
                }
                Widgets.UTabButton {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("通用")
                }

                Widgets.UTabButton {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("工程")
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: 25
                color: "transparent"
            }
        }
    }
    Rectangle {
        id: menuBoxLine
        width: parent.width
        height: 1
        color: "#2b2d2e"
        anchors.left: parent.left
        anchors.top: menuBox.bottom
    }
    Rectangle {
        id: toolBox
        width: parent.width
        height: 70
        anchors.left: parent.left
        anchors.top: menuBoxLine.bottom
        color: "#333536"
        StackLayout {
            anchors.fill: toolBox
            currentIndex: menuBar.currentIndex
            RowLayout {
                Layout.topMargin: 20
                spacing: 0
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 10
                    source: "/content/images/icon_workspace_24.svg"
                    text: qsTr("工作区")
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_full_screen_24.svg"
                    text: qsTr("全屏显示")
                }
                Rectangle {
                    width: 1
                    height: 50
                    Layout.leftMargin: 5
                    Layout.rightMargin: 3
                    color: "#464646"
                }

                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_lang_24.svg"
                    text: qsTr("多语言设置")
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_help_24.svg"
                    text: qsTr("帮助文档")
                }
                Rectangle {
                    width: 1
                    height: 50
                    Layout.leftMargin: 5
                    Layout.rightMargin: 3
                    color: "#464646"
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_home_24.svg"
                    text: qsTr("首页")
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_about_24.svg"
                    text: qsTr("关于")
                }
                Rectangle {
                    width: 1
                    height: 50
                    Layout.leftMargin: 5
                    Layout.rightMargin: 3
                    color: "#464646"
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_update_24.svg"
                    text: qsTr("检查更新")
                }
                Rectangle {
                    Layout.fillWidth: true
                    height: parent.height
                }
            }
            RowLayout {
                Layout.topMargin: 20
                spacing: 0
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 10
                    source: "/content/images/icon_new_project_24.svg"
                    text: qsTr("新建工程")
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_open_project_24.svg"
                    text: qsTr("打开工程")
                }
                Rectangle {
                    width: 1
                    height: 50
                    Layout.leftMargin: 5
                    Layout.rightMargin: 3
                    color: "#464646"
                }

                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_close_project_24.svg"
                    text: qsTr("关闭当前工程")
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_save_24.svg"
                    text: qsTr("保存当前工程")
                }
                Rectangle {
                    width: 1
                    height: 50
                    Layout.leftMargin: 5
                    Layout.rightMargin: 3
                    color: "#464646"
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_connect_device_24.svg"
                    text: qsTr("连接设备")
                }

                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_unlink_24.svg"
                    text: qsTr("断开设备")
                }
                Rectangle {
                    width: 1
                    height: 50
                    Layout.leftMargin: 5
                    Layout.rightMargin: 3
                    color: "#464646"
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_project_test_24.svg"
                    text: qsTr("本地调试")
                }

                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_remove_help_24.svg"
                    text: qsTr("远程调试")
                }
                Rectangle {
                    width: 1
                    height: 50
                    Layout.leftMargin: 5
                    Layout.rightMargin: 3
                    color: "#464646"
                }
                Widgets.UIconAboveTextButton {
                    Layout.leftMargin: 2
                    source: "/content/images/icon_switch_user_24.svg"
                    text: qsTr("切换用户")
                }
                Rectangle {
                    Layout.fillWidth: true
                    height: parent.height
                }
            }
        }
    }

}
