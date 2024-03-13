import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

GroupBox {
    title: qsTr("发送设置")

    ColumnLayout {
        spacing: 10
        anchors.fill: parent

        GridLayout {
            columns: 5
            columnSpacing: 10 // 设置列之间的间距
            Layout.fillWidth: true

            FluCheckBox {
                text: "DTS"
            }

            FluCheckBox {
                text: "RTS"
            }

            FluCheckBox {
                text: "sensd with enter"
            }

            FluCheckBox {
                text: "show\\r\\n"
            }

            FluCheckBox {
                text: "show time"
            }
        }

        RowLayout {
            Layout.fillWidth: true
            FluMultilineTextBox {
                Layout.fillWidth: true
                Layout.fillHeight: true
                id: sendDataTextField
            }

            ColumnLayout {
                FluButton {
                    text: "发送"
                }

                FluButton {
                    text: "添加"
                }
            }
        }
    }
}
