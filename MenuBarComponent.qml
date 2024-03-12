import QtQuick
import QtQuick.Controls

MenuBar {
    Menu {
        title: "File"

        MenuItem {
            text: "New"
            onTriggered: {

                // 点击时的操作
            }
        }

        MenuItem {
            text: "New"
            onTriggered: {

                // 点击时的操作
            }
        }

        MenuItem {
            text: "New"
            onTriggered: {

                // 点击时的操作
            }
        }

        MenuSeparator {}

        MenuItem {
            text: "Exit"
            onTriggered: {
                Qt.quit()
            }
        }
    }

    Menu {
        title: "Edit"

        MenuItem {
            text: "Undo"
            // ... 其他属性和行为
        }

        MenuItem {
            text: "Redo"
            // ... 其他属性和行为
        }
    }
}
