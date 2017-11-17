import QtQuick 2.10
import QtQuick.Controls 2.3
import Qt.labs.platform 1.0 as P      // [1]

ApplicationWindow {
  visible: true
  width: 320
  height: 200
  title: "Dialog Example"

  menuBar: MenuBar {
    Menu {
      title: "&File"
      Action {
        text: "&Exit..."
        onTriggered: close()          // ウインドウを閉じる
      }
    }
  }
  //ウインドウを閉じるときのシグナル
  onClosing: {
    close.accepted = false    //ウインドウを閉じるのを拒否   [2]
    confirm.open()            //確認ダイアログを開く        [3]
  }
  //確認ダイアログ                                       [4]
  P.MessageDialog {
    id: confirm
    title: "Exit?"                          //ダイアログタイトル
    text: "Will you sleep soon?"            //本文
    buttons: P.MessageDialog.Yes | P.MessageDialog.No //[5]
    onClicked: {
      //押されたボタンを確認
      if(button === P.MessageDialog.Yes)           //[6]
        Qt.quit()
    }
  }
}
