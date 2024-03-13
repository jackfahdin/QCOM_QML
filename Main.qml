import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import FluentUI

FluWindow {
    width: 960
    height: 800
    visible: true
    showStayTop: true
    showDark: true
    title: qsTr("Hello World")

    // 行排序
    RowLayout {
        anchors.fill: parent
        anchors.margins: 20
        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            SerialPortConfigComponent {
                Layout.preferredWidth: 500
            }
            ResultDisplayComponent {
                Layout.preferredWidth: 500
                Layout.fillHeight: true
            }
            CarryTaskDsiaplyComponent {
                Layout.preferredWidth: 500
                Layout.fillHeight: true
            }
            InputSettingsComponent {
                Layout.preferredWidth: 500
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            // spacing: 10
            // CommandListComponent {}
            CommandListComponent1 {}
        }
    }
}
