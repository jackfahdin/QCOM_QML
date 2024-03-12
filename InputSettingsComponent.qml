import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GroupBox {
    title: qsTr("发送设置")

    ColumnLayout {
        spacing: 10

        GridLayout {
            columns: 2
            columnSpacing: 10 // 设置列之间的间距
            rowSpacing: 10 // 设置行之间的间距

            CheckBox {
                text: "DTS"
            }

            CheckBox {
                text: "RTS"
            }

            CheckBox {
                text: "show\r\n"
            }

            CheckBox {
                text: "show time"
            }

            CheckBox {
                text: "sensd with enter"
            }
        }

        RowLayout {
            TextField {
                id: sendDataTextField
            }

            ColumnLayout {
                Button {
                    text: "发送"
                }

                Button {
                    text: "保存到右侧列表"
                }
            }
        }
    }
}
