import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

GroupBox {
    title: qsTr("配置")

    RowLayout {
        anchors.fill: parent

        GridLayout {
            columns: 2
            columnSpacing: 10 // 设置列之间的间距
            rowSpacing: 1 // 设置行之间的间距
            FluText {
                text: qsTr("串口")
            }
            FluComboBox {
                id: serialPortComboBox
                Layout.fillWidth: true
                model: SerialPortHelper.availablePorts()
            }

            FluText {
                text: qsTr("波特率")
            }
            FluComboBox {
                id: baudRateComboBox
                Layout.fillWidth: true
                model: [1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200]
            }

            FluText {
                text: qsTr("数据位")
            }
            FluComboBox {
                id: dataComboBox
                Layout.fillWidth: true
                model: [5, 6, 7, 8]
            }

            FluText {
                text: qsTr("校验位")
            }
            FluComboBox {
                id: parityComboBox
                Layout.fillWidth: true
                model: [2400, 4800, 9600, 19200, 38400, 57600, 115200]
            }

            FluText {
                text: qsTr("波特率")
            }
            FluComboBox {
                id: stopComboBox
                Layout.fillWidth: true
                model: [1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200]
            }
        }

        FluToggleSwitch {// textRight: false
            // text: "打开"
        }
    }
}
