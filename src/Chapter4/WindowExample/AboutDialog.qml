import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

Window {
  id: root
  //ウインドウサイズはメッセージとボタンのサイズに合わせる
  width: content.width + 20
  height: content.height + 20
  //デフォルトをモーダルに変更               [1]
  modality: Qt.ApplicationModal
  title: "About"

  //アイコン　メッセージ
  //     ボタン       な位置関係に並べる
  ColumnLayout {
    id: content
    anchors.centerIn: parent
    spacing: 15
    RowLayout {
      spacing: 10
      //アイコンを表示
      Image { source: "sweets.png" }
      //メッセージ
      ColumnLayout {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5
        Label { text: "Qt Quick!"; font.pointSize: 14 }
        Label { text: "It's so mach fun."; font.pointSize: 10 }
      }
    }
    //OKボタン
    Button {
      anchors.horizontalCenter: parent.horizontalCenter
      text: "OK"
      onClicked: {
        //ウインドウを非表示にする          [2]
        root.visible = false
      }
    }
  }
}
