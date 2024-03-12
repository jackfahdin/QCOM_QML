import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GroupBox {
    title: qsTr("配置")

    RowLayout {
        width: parent.width // 相对父容器宽度

        // 网格
        GridLayout {
            columns: 2
            columnSpacing: 10 // 设置列之间的间距
            rowSpacing: 10 // 设置行之间的间距
            width: parent.width // 使用父元素的宽度

            Label {
                text: qsTr("串口")
            }
            ComboBox {
                id: serialPortComboBox
                Layout.fillWidth: true
                model: SerialPortHelper.availablePorts()
            }

            Label {
                text: qsTr("波特率")
            }
            ComboBox {
                id: baudRateComboBox
                Layout.fillWidth: true
                model: [1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200]
            }

            Label {
                text: qsTr("数据位")
            }
            ComboBox {
                id: dataComboBox
                Layout.fillWidth: true
                model: [5, 6, 7, 8]
            }

            Label {
                text: qsTr("校验位")
            }
            ComboBox {
                id: parityComboBox
                Layout.fillWidth: true
                model: [2400, 4800, 9600, 19200, 38400, 57600, 115200]
            }

            Label {
                text: qsTr("波特率")
            }
            ComboBox {
                id: stopComboBox
                Layout.fillWidth: true
                model: [1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200]
            }
        }

        Button {
            text: "打开"
        }
    }
}
