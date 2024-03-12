import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

GroupBox {
    title: qsTr("命令列表")

    ColumnLayout {
        spacing: 10
        GroupBox {
            spacing: 10
            CheckBox {
                text: "全选"
            }

            Text {
                text: "发送"
            }

            Text {
                text: "延时"
            }
        }

        TextArea {
            id: sendDataTextArea
            readOnly: true
        }

        RowLayout {
            spacing: 10

            Button {
                text: "保存"
            }

            Button {
                text: "清除"
            }
        }
    }
}
