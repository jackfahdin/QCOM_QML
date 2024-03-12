import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MenuBar {
        id: menuBar
    }

    // 列排序
    ColumnLayout {
        anchors.top: menuBar.bottom
        SerialPortConfigComponent {}
    }

    Component.onCompleted: {
        menuBar.contentItem = Qt.createComponent(
                    "MenuBarComponent.qml").createObject(menuBar)
    }
}
