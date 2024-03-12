import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

GroupBox {
    title: qsTr("配置")

    ColumnLayout {
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
