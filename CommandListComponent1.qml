import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI

FluContentPage{
    id:root
    Layout.fillWidth: true
        Layout.fillHeight: true
    signal checkBoxChanged

    property var dataSource : []
    property bool seletedAll: true

    Component.onCompleted: {
        loadData(1,2)
    }

    onCheckBoxChanged: {
        for(var i =0;i< table_view.rows ;i++){
            if(false === table_view.getRow(i).checkbox.options.checked){
                root.seletedAll = false
                return
            }
        }
        root.seletedAll = true
    }

    FluMenu{
        id:pop_filter
        width: 200
        height: 89

        contentItem: Item{

            onVisibleChanged: {
                if(visible){
                    name_filter_text.text = root.nameKeyword
                    name_filter_text.cursorPosition = name_filter_text.text.length
                    name_filter_text.forceActiveFocus()
                }
            }

            FluTextBox{
                id:name_filter_text
                anchors{
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    leftMargin: 10
                    rightMargin: 10
                    topMargin: 10
                }
                iconSource: FluentIcons.Search
            }

            FluButton{
                text: qsTr("Search")
                anchors{
                    bottom: parent.bottom
                    right: parent.right
                    bottomMargin: 10
                    rightMargin: 10
                }
                onClicked: {
                    root.nameKeyword = name_filter_text.text
                    pop_filter.close()
                }
            }

        }

        function showPopup(){
            table_view.closeEditor()
            pop_filter.popup()
        }

    }

    Component{
        id:com_checbox
        Item{
            FluCheckBox{
                anchors.centerIn: parent
                checked: true === options.checked
                enableAnimation: false
                clickListener: function(){
                    var obj = table_view.getRow(row)
                    obj.checkbox = table_view.customItem(com_checbox,{checked:!options.checked})
                    table_view.setRow(row,obj)
                    checkBoxChanged()
                }
            }
        }
    }

    Component{
        id:com_column_filter_name
        Item{
            FluText{
                text: qsTr("Name")
                anchors.centerIn: parent
            }
            FluIconButton{
                width: 20
                height: 20
                iconSize: 12
                verticalPadding:0
                horizontalPadding:0
                iconSource: FluentIcons.Filter
                iconColor: {
                    if("" !== root.nameKeyword){
                        return FluTheme.primaryColor
                    }
                    return FluTheme.dark ?  Qt.rgba(1,1,1,1) : Qt.rgba(0,0,0,1)
                }
                anchors{
                    right: parent.right
                    rightMargin: 3
                    verticalCenter: parent.verticalCenter
                }
                onClicked: {
                    pop_filter.showPopup()
                }
            }
        }
    }

    Component{
        id:com_action
        Item{
            RowLayout{
                anchors.centerIn: parent
                FluButton{
                    text: qsTr("Delete")
                    onClicked: {
                        table_view.closeEditor()
                        table_view.removeRow(row)
                    }
                }
                FluFilledButton{
                    text: qsTr("Edit")
                    onClicked: {
                        var obj = table_view.getRow(row)
                        obj.name = "12345"
                        table_view.setRow(row,obj)
                        showSuccess(JSON.stringify(obj))
                    }
                }
            }
        }
    }


    Component{
        id:com_column_checbox
        Item{
            RowLayout{
                anchors.centerIn: parent
                FluText{
                    text: qsTr("Select All")
                    Layout.alignment: Qt.AlignVCenter
                }
                FluCheckBox{
                    checked: true === root.seletedAll
                    enableAnimation: false
                    Layout.alignment: Qt.AlignVCenter
                    clickListener: function(){
                        root.seletedAll = !root.seletedAll
                        var checked = root.seletedAll
                        itemModel.display = table_view.customItem(com_column_checbox,{"checked":checked})
                        for(var i =0;i< table_view.rows ;i++){
                            var rowData = table_view.getRow(i)
                            rowData.checkbox = table_view.customItem(com_checbox,{"checked":checked})
                            table_view.setRow(i,rowData)
                        }
                    }
                }
            }
        }
    }

    Component{
        id:com_combobox
        FluComboBox {
            anchors.fill: parent
            focus: true
            editText: display
            editable: true
            model: ListModel {
                ListElement { text: "100" }
                ListElement { text: "300" }
                ListElement { text: "500" }
                ListElement { text: "1000" }
            }
            Component.onCompleted: {
                currentIndex=["100","300","500","1000"].findIndex((element) => element === display)
                selectAll()
            }
            onCommit: {
                editTextChaged(editText)
                tableView.closeEditor()
            }
        }
    }

    Component{
        id:com_column_update_title
        Item{
            FluText{
                id:text_title
                text: {
                    if(options.title){
                        return options.title
                    }
                    return ""
                }
                anchors.fill: parent
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignHCenter
                elide: Text.ElideRight
            }
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    custom_update_dialog.showDialog(options.title,function(text){
                        itemModel.display = table_view.customItem(com_column_update_title,{"title":text})
                    })
                }
            }
        }
    }

    FluArea{
        id:layout_controls
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: 40

        Row{
            spacing: 5
            anchors{
                left: parent.left
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }

            FluButton{
                text: qsTr("Clear All")
                onClicked: {
                    table_view.dataSource = []
                }
            }

            FluButton{
                text: qsTr("Delete Selection")
                onClicked: {
                    var data = []
                    var rows = []
                    for (var i = 0; i < table_view.rows; i++) {
                        var item = table_view.getRow(i);
                        rows.push(item)
                        if (!item.checkbox.options.checked) {
                            data.push(item);
                        }
                    }
                    var sourceModel = table_view.sourceModel;
                    for (i = 0; i < sourceModel.rowCount; i++) {
                        var sourceItem = sourceModel.getRow(i);
                        const foundItem = rows.find(item=> item._key === sourceItem._key)
                        if (!foundItem) {
                            data.push(sourceItem);
                        }
                    }
                    table_view.dataSource = data
                }
            }

            FluButton{
                text: qsTr("Add a row of Data")
                onClicked: {
                    table_view.appendRow(genTestObject())
                }
            }

        }
    }

    FluTableView{
        id:table_view
        anchors{
            left: parent.left
            right: parent.right
            top: layout_controls.bottom
            bottom: gagination.top
        }
        anchors.topMargin: 5
        onRowsChanged: {
            root.checkBoxChanged()
        }
        columnSource:[
            {
                title: table_view.customItem(com_column_checbox,{checked:true}),
                dataIndex: 'checkbox',
                width:100,
                minimumWidth:100,
                maximumWidth:100
            },
            {
                title: qsTr("Address"),
                dataIndex: 'address',
                width:200,
                minimumWidth:100,
                maximumWidth:250
            },
            {
                title: qsTr("Nickname"),
                dataIndex: 'nickname',
                width:100,
                minimumWidth:80,
                maximumWidth:200
            },
            {
                title: qsTr("Long String"),
                dataIndex: 'longstring',
                width:200,
                minimumWidth:100,
                maximumWidth:300
            },
            {
                title: qsTr("Options"),
                dataIndex: 'action',
                width:160,
                minimumWidth:160,
                maximumWidth:160
            }
        ]
    }

    FluPagination{
        id:gagination
        anchors{
            bottom: parent.bottom
            left: parent.left
        }
        pageCurrent: 1
        itemCount: 100000
        pageButtonCount: 7
        __itemPerPage: 1000
        previousText: qsTr("<Previous")
        nextText: qsTr("Next>")
        onRequestPage:
            (page,count)=> {
                table_view.closeEditor()
                loadData(page,count)
                table_view.resetPosition()
            }
    }

    function genTestObject(){
        var nicknames = ["复海大圣","混天大圣","移山大圣","通风大圣","驱神大圣","齐天大圣","平天大圣"]
        function getRandomNickname(){
            var randomIndex = Math.floor(Math.random() * nicknames.length);
            return nicknames[randomIndex];
        }
        var addresses = ["傲来国界花果山水帘洞","傲来国界坎源山脏水洞","大唐国界黑风山黑风洞","大唐国界黄风岭黄风洞","大唐国界骷髅山白骨洞","宝象国界碗子山波月洞","宝象国界平顶山莲花洞","宝象国界压龙山压龙洞","乌鸡国界号山枯松涧火云洞","乌鸡国界衡阳峪黑水河河神府"]
        function getRandomAddresses(){
            var randomIndex = Math.floor(Math.random() * addresses.length);
            return addresses[randomIndex];
        }

        return {
            checkbox: table_view.customItem(com_checbox,{checked:root.seletedAll}),
            address: getRandomAddresses(),
            nickname: getRandomNickname(),
            longstring:"你好",
            action: table_view.customItem(com_action),
            _minimumHeight:50,
            _key:FluTools.uuid()
        }
    }
    function loadData(page,count){
        root.seletedAll = true
        const dataSource = []
        for(var i=0;i<count;i++){
            dataSource.push(genTestObject())
        }
        root.dataSource = dataSource
        table_view.dataSource = root.dataSource
    }
}
