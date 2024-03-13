import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI

GroupBox {
    title: qsTr("命令列表")
    Layout.fillWidth: true
    Layout.fillHeight: true
    FluContentPage {
        id: root
        title: "qqq"

        // 顶部区域
        FluArea {
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                topMargin: 20
            }

            height: 60

            Row {
                spacing: 5
                anchors {
                    left: parent.left
                    leftMargin: 10
                    verticalCenter: parent.verticalCenter
                }

                FluButton {
                    text: qsTr("清除")
                    onClicked: {
                        showSuccess("清除列表")
                    }
                }

                FluButton {
                    text: qsTr("新增一行数据")
                    onClicked: {
                        showSuccess("新增一行命令")
                    }
                }
            }
        }

        FluTableView {
            anchors {
                left: parent.left
                right: parent.right
                top: layout_controls.bottom
                bottom: gagination.top
            }
            anchors.topMargin: 5
            onRowsChanged: {

                // root.checkBoxChanged()
            }
            columnSource: [{
                    "title": table_view.customItem(com_column_checbox, {
                                                       "checked": true
                                                   }),
                    "dataIndex": 'checkbox',
                    "width": 100,
                    "minimumWidth": 100,
                    "maximumWidth": 100
                }, {
                    "title": table_view.customItem(com_column_update_title, {
                                                       "title": qsTr("Avatar")
                                                   }),
                    "dataIndex": 'avatar',
                    "width": 100
                }, {
                    "title": table_view.customItem(com_column_filter_name, {
                                                       "title": qsTr("Name")
                                                   }),
                    "dataIndex": 'name',
                    "readOnly": true
                }, {
                    "title": table_view.customItem(com_column_sort_age, {
                                                       "sort": 0
                                                   }),
                    "dataIndex": 'age',
                    "editDelegate": com_combobox,
                    "width": 100,
                    "minimumWidth": 100,
                    "maximumWidth": 100
                }, {
                    "title": qsTr("Address"),
                    "dataIndex": 'address',
                    "width": 200,
                    "minimumWidth": 100,
                    "maximumWidth": 250
                }, {
                    "title": qsTr("Nickname"),
                    "dataIndex": 'nickname',
                    "width": 100,
                    "minimumWidth": 80,
                    "maximumWidth": 200
                }, {
                    "title": qsTr("Long String"),
                    "dataIndex": 'longstring',
                    "width": 200,
                    "minimumWidth": 100,
                    "maximumWidth": 300
                }, {
                    "title": qsTr("Options"),
                    "dataIndex": 'action',
                    "width": 160,
                    "minimumWidth": 160,
                    "maximumWidth": 160
                }]
        }

        FluPagination {
            id: gagination
            anchors {
                bottom: parent.bottom
                left: parent.left
            }
            pageCurrent: 1
            itemCount: 100000
            pageButtonCount: 7
            __itemPerPage: 1000
            previousText: qsTr("<Previous")
            nextText: qsTr("Next>")
            onRequestPage: (page, count) => {
                               table_view.closeEditor()
                               loadData(page, count)
                               table_view.resetPosition()
                           }
        }

        function loadData(page, count) {
            root.seletedAll = true
            const dataSource = []
            for (var i = 0; i < count; i++) {
                dataSource.push(genTestObject())
            }
            root.dataSource = dataSource
            table_view.dataSource = root.dataSource
        }
    }
}
