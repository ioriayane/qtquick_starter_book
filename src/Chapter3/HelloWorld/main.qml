//使用するエレメントに合わせてモジュールをインポート
import QtQuick 2.10
import QtQuick.Controls 2.3

//ヘッダー・フッターなどを追加できるウインドウ用エレメント  [1]
ApplicationWindow {
  //作成したウインドウを表示状態に               [2]
  visible: true
  //コンテンツ領域のサイズ                     [3]
  width: 640
  height: 480
  //ウインドウタイトル
  title: qsTr("Tabs")

  //複数のページをスワイプ動作で切り替え可能な表示領域 [4]
  SwipeView {
    id: swipeView
    anchors.fill: parent
    //表示ページをタブの選択状態と連動            [5]
    currentIndex: tabBar.currentIndex

    //1ページ目（内容は別ファイルで定義）
    Page1Form {
    }
    //2ページ目（内容は別ファイルで定義）
    Page2Form {
    }
  }
  //表示するページを選択するためのタブ領域
  footer: TabBar {
    id: tabBar
    //SwipeViewの表示ページと連動             [6]
    currentIndex: swipeView.currentIndex

    TabButton {
      text: qsTr("Page 1")
    }
    TabButton {
      text: qsTr("Page 2")
    }
  }
}
