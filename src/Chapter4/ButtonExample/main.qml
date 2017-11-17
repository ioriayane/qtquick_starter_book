import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
  visible: true
  width: 320
  height: 200
  title: "Button Example"

  //ボタンなどを縦に並べる
  GridLayout {
    anchors.centerIn: parent
    columns: 2

    //テスト用の文字列を表示
    Label {
      id: message
      text: "Button Example"
      Layout.columnSpan: 2
    }

    //通常のボタン [1]
    Button {
      //ボタンの文字列
      text: "Click!"
      //クリックしたらテキストの表示を変更
      onClicked: message.text = "Click!"
    }

    //アイコン付きのボタン  [2]
    Button {
      //アイコン画像を設定
      icon.source: "check.png"
      //アイコンとテキストの表示組み合わせ設定
      display: AbstractButton.TextBesideIcon
      //ボタンの文字列
      text: "Click!!"
      //クリックしたらテキストの表示を変更
      onClicked: message.text = "Click!!"
    }

    //トグルボタン [3]
    Button {
      //現在の状態をテキストで表示
      text: checked ? "ON" : "OFF"
      //トグルボタンにする
      checkable: true
      //チェック状態が変化したらテキスト表示を変更
      onToggled: message.text = "Toggle!"
    }

    //ディレイボタン [4]
    DelayButton {
      //ボタンの文字列
      text: checked ? "ON" : "OFF"
      //状態変化が確定したらテキスト表示を変更
      onActivated: message.text = "Activate!"
    }

    //角丸ボタン [5]
    RoundButton {
      //ボタンの文字列
      text: "\u2713"
      //クリックしたらテキストの表示を変更
      onClicked: message.text = text
    }

    //角丸ボタン [6]
    RoundButton {
      //角丸の半径
      radius: height * 0.2
      //ボタンの文字列
      text: "\u2713Check!!!!"
      //クリックしたらテキストの表示を変更
      onClicked: message.text = text
    }
  }
}
