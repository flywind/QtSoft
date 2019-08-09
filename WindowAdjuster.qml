import QtQuick 2.11

MouseArea {
    id: root
    acceptedButtons: Qt.LeftButton
    hoverEnabled: true

    property var window: parent

    property int borderWidth: 8
    property int minimumWidth: 320
    property int minimumHeight: 240
    property int maximumWidth: 0
    property int maximumHeight: 0

    // Program runtime dynamic data
    property int resizing: 0
    property real firstWidth: 0
    property real firstHeight: 0
    property real firstMouseX: 0
    property real firstMouseY: 0

    function getValidWidth(width) {
        if (minimumWidth > 0 && width < minimumWidth)
            return minimumWidth;

        if (maximumWidth > minimumWidth && width > maximumWidth)
            return maximumWidth;

        return width;
    }

    function getValidHeight(height) {
        if (minimumHeight > 0 && height < minimumHeight)
            return minimumHeight;

        if (maximumHeight > minimumHeight && height > maximumHeight)
            return maximumHeight;

        return height;
    }

    function getMousePosition(mouseX, mouseY) {
        if (mouseX < borderWidth) {
            if (mouseY < borderWidth) {
                return 1; // left top
            } else if (mouseY < root.height - borderWidth) {
                return 2; // left
            } else {
                return 3; // left bottom
            }
        } else if (mouseX < root.width - borderWidth) {
            if (mouseY < borderWidth) {
                return 4; // top
            } else if (mouseY < root.height - borderWidth) {
                return 5; // center
            } else {
                return 6; // bottom
            }
        } else {
            if (mouseY < borderWidth) {
                return 7; // right top
            } else if (mouseY < root.height - borderWidth) {
                return 8; // right
            } else {
                return 9; // right bottom
            }
        }
    }

    function getCursorShape(window, mouseX, mouseY) {
        switch (getMousePosition(window, mouseX, mouseY)) {
        case 1: return Qt.SizeFDiagCursor;
        case 2: return Qt.SizeHorCursor;
        case 3: return Qt.SizeBDiagCursor;
        case 4: return Qt.SizeVerCursor;
        case 5: return Qt.ArrowCursor;
        case 6: return Qt.SizeVerCursor;
        case 7: return Qt.SizeBDiagCursor;
        case 8: return Qt.SizeHorCursor;
        case 9: return Qt.SizeFDiagCursor;
        default: break;
        }

        return Qt.ArrowCursor;
    }

    function resizeLeftTop(window, mouseX, mouseY) {
        var offsetX = mouseX - firstMouseX;
        var offsetY = mouseY - firstMouseY;

        var x = window.x + offsetX;
        var y = window.y + offsetY;
        var width = window.width - offsetX;
        var height = window.height - offsetY;

        // Lock-in maximum and minimum
        offsetX = width - getValidWidth(width);
        offsetY = height - getValidHeight(height);
        x = x + offsetX;
        width = width - offsetX;
        y = y + offsetY;
        height = height - offsetY;

        window.x = x;
        window.y = y;
        window.width = width;
        window.height = height;
    }

    function resizeLeft(window, mouseX, mouseY) {
        var offsetX = mouseX - firstMouseX;

        var x = window.x + offsetX;
        var width = window.width - offsetX;

        // Lock-in maximum and minimum
        offsetX = width - getValidWidth(width);
        x = x + offsetX;
        width = width - offsetX;

        window.x = x;
        window.width = width;
    }

    function resizeLeftBottom(window, mouseX, mouseY) {
        var offsetX = mouseX - firstMouseX;
        var offsetY = mouseY - firstMouseY;

        var x = window.x + offsetX;
        var width = window.width - offsetX;
        var height = firstHeight + offsetY;

        // Lock-in maximum and minimum
        offsetX = width - getValidWidth(width);
        x = x + offsetX;
        width = width - offsetX;
        height = getValidHeight(height);

        window.x = x;
        window.width = width;
        window.height = height;
    }

    function resizeTop(window, mouseX, mouseY) {
        var offsetY = mouseY - firstMouseY;

        var y = window.y + offsetY;
        var height = window.height - offsetY;

        // Lock-in maximum and minimum
        offsetY = height - getValidHeight(height);
        y = y + offsetY;
        height = height - offsetY;

        window.y = y;
        window.height = height;
    }

    function resizeBottom(window, mouseX, mouseY) {
        var offsetY = mouseY - firstMouseY;

        var height = firstHeight + offsetY;

        // Lock-in maximum and minimum
        height = getValidHeight(height);

        window.height = height;
    }

    function resizeRightTop(window, mouseX, mouseY) {
        var offsetX = mouseX - firstMouseX;
        var offsetY = mouseY - firstMouseY;

        var y = window.y + offsetY;
        var width = firstWidth + offsetX;
        var height = window.height - offsetY;

        // Lock-in maximum and minimum
        offsetY = height - getValidHeight(height);
        y = y + offsetY;
        width = getValidWidth(width);
        height = height - offsetY;

        window.y = y;
        window.width = width;
        window.height = height;
    }

    function resizeRight(window, mouseX, mouseY) {
        var offsetX = mouseX - firstMouseX;

        var width = firstWidth + offsetX;

        // Lock-in maximum and minimum
        width = getValidWidth(width);

        window.width = width;
    }

    function resizeRightBottom(window, mouseX, mouseY) {
        var offsetX = mouseX - firstMouseX;
        var offsetY = mouseY - firstMouseY;

        var width = firstWidth + offsetX;
        var height = firstHeight + offsetY;

        // Lock-in maximum and minimum
        width = getValidWidth(width);
        height = getValidHeight(height);

        window.width = width;
        window.height = height;
    }

    //窗体运动功能在头部实现
    function move(window, mouseX, mouseY) {
        //window.x = window.x + (mouseX - firstMouseX);
        //window.y = window.y + (mouseY - firstMouseY);
    }

    function resize(window, mouseX, mouseY) {
        switch (resizing) {
        case 1:
            resizeLeftTop(window, mouseX, mouseY);
            break;
        case 2:
            resizeLeft(window, mouseX, mouseY);
            break;
        case 3:
            resizeLeftBottom(window, mouseX, mouseY);
            break;
        case 4:
            resizeTop(window, mouseX, mouseY);
            break;
        case 5:
            move(window, mouseX, mouseY);
            break;
        case 6:
            resizeBottom(window, mouseX, mouseY);
            break;
        case 7:
            resizeRightTop(window, mouseX, mouseY);
            break;
        case 8:
            resizeRight(window, mouseX, mouseY);
            break;
        case 9:
            resizeRightBottom(window, mouseX, mouseY);
            break;
        default:
            break;
        }
    }

    onPositionChanged: {
        //需设置hoverEnabled: true, 否则只有按下获取鼠标点位置
        //console.log(mouse.x, mouse.y)
        if (resizing == 0) {
            cursorShape = getCursorShape(mouse.x, mouse.y);
        } else {
            resize(window, mouse.x, mouse.y);
        }
    }

    onPressed: {
        resizing = getMousePosition(mouseX, mouseY);
        firstWidth = window.width;
        firstHeight = window.height;
        firstMouseX = mouseX;
        firstMouseY = mouseY;
    }

    onReleased: {
        resizing = 0;
    }
}

