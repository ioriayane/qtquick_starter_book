import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
  id: root
  visible: true
  width: 320;  height: 240
  title: "Window Example"
  //メニュー
  menuBar: MenuBar {
    Menu {
      title: "&File"
      Action { text: "&Exit..."; onTriggered: Qt.quit() }
    }
    Menu {
      title: "&Help"
      Action {
        text: "&About..."
        onTriggered: about.show()   //ダイアログ表示 [1]
      }
    }
  }
  //Aboutダイアログ
  AboutDialog {
    id: about
    color: root.color             //背景色は親のウインドウ色に合わせる    [2]
  }
}
