import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
  visible: true
  width: 480
  height: 320
  title: qsTr("QtQuickDesignerExample")

  menuBar: MenuBar {
    Menu {
      title: qsTr("File")
      MenuItem {
        //メニューの項目をチェック可能状態にする
        id: menuButtonCheckable
        text: qsTr("Button Checkable")
        checkable: true
      }
      MenuItem {
        text: qsTr("Exit")
        onTriggered: Qt.quit();
      }
    }
  }

  Contents {
    anchors.fill: parent
    //メニューのチェック状態でモード切り替え [1]
    button1.checkable: menuButtonCheckable.checked
    button1.onClicked: {
      //通常ボタンのときだけダイアログ表示
      if(!button1.checkable)
        messageDialog.show(qsTr("Button 1 pressed"))
    }
    //メニューのチェック状態でモード切り替え
    button2.checkable: menuButtonCheckable.checked
    button2.onClicked: {
      if(!button2.checkable)
        messageDialog.show(qsTr("Button 2 pressed"))
    }
  }

  Dialog {
    id: messageDialog
    x: parent.width / 2 - width / 2
    y: parent.height / 2 - height / 2
    title: qsTr("May I have your attention, please?")
    modal: true
    standardButtons: Dialog.Ok
    //メッセージラベル
    Label {
      id: messageLabel
      anchors.centerIn: parent
    }
    //ダイアログ表示補助
    function show(caption) {
      messageLabel.text = caption;
      messageDialog.open();
    }
  }
}
