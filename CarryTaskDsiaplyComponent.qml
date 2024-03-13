import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI

GroupBox {
    title: qsTr("发送任务显示")

    ColumnLayout {
        anchors.fill: parent
        FluMultilineTextBox {
            id: sendDataTextArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            readOnly: true
        }

        RowLayout {
            spacing: 10
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignRight

            FluButton {
                text: "保存"
            }

            FluButton {
                text: "清除"
            }
        }
    }
}
