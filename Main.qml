import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // MenuBar {
    //     id: menuBar
    // }

    // 行排序
    GridLayout {
        columns: 2
        columnSpacing: 10 // 设置列之间的间距
        rowSpacing: 10 // 设置行之间的间距
        ColumnLayout {
            spacing: 10
            //anchors.top: menuBar.bottom
            SerialPortConfigComponent {}
            ResultDisplayComponent {}
            CarryTaskDsiaplyComponent {}
            InputSettingsComponent {}
        }

        ColumnLayout {
            spacing: 10
            CommandListComponent {}
        }
    }

    // Component.onCompleted: {
    //     menuBar.contentItem = Qt.createComponent(
    //                 "MenuBarComponent.qml").createObject(menuBar)
    // }
}
