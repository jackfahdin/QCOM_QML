import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import FluentUI

GroupBox {
    title: qsTr("AT指令显示结果")

    ColumnLayout {
        anchors.fill: parent
        FluMultilineTextBox {
            id: receivedDataTextArea
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
