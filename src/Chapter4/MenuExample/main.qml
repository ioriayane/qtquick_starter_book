import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQml 2.2

ApplicationWindow {
  visible: true
  width: 480
  height: 320
  title: qsTr("Menu Example")

  //メニューバーを作成
  menuBar: MenuBar {
    //1つ目のメニュー
    Menu {
      //メニューのタイトル                                 [1]
      title: "&File"
      //ファイルを開く
      Action {
        text: "&Open... "
        //ショートカットの設定                               [2]
        shortcut: StandardKey.Open
        onTriggered: message.text = "Open!!"
      }
      //区切り線
      MenuSeparator {}
      //最近選択した項目
      Menu {
        id: recentItem
        title: "&Recent"
        //登録されるまで無効
        enabled: recentItemModel.count > 0
        //メニューの内容を別管理                           [3]
        Instantiator {
          id: instantiator
          model: ListModel { id: recentItemModel }  //[4]
          Action {
            text: model.text
            icon.source: model.icon
            onTriggered: message.text = "recent:%1".arg(text)
          }
          //modelへの追加・削除に連動して親のMenuに追加・削除   [5]
          onObjectAdded: recentItem.insertAction(index, object)
          onObjectRemoved: recentItem.takeAction(index)
        }
        //最近選択した項目へ登録する
        function insertRecentItem(action){
          message.text = action.text
          //Instantiatorのモデルへ追加                   [6]
          recentItemModel.insert(0, {"text": action.text
                                   , "icon": action.icon.source + ""})
          //5つより多くなったら最後を1つ消す
          if(recentItemModel.count > 5){
            //Instantiatorのモデルから削除
            recentItemModel.remove(recentItemModel.count-1)
          }
        }
      }
      //区切り線
      MenuSeparator {}
      //アプリケーションを終了
      Action {
        text: "&Quit"
        shortcut: StandardKey.Quit
        onTriggered: Qt.quit()
      }
    }
    //2つ目のメニュー
    Menu {
      title: "&Status"
      //2階層目のメニュー
      Menu {
        title: "Character"
        Action {
          id: strawberry
          text: "Strawberry"
          //アイコンの設定                               [7]
          icon.source: "strawberry.png"
          //最近使用した項目へ登録
          onTriggered: recentItem.insertRecentItem(strawberry)
        }
        Action {
          id: macaroon
          text: "Macaroon" + "_"+ counter
          //アイコンの設定
          icon.source: "macaroon.png"
          //最近使用した項目へ登録
          onTriggered: {
            recentItem.insertRecentItem(macaroon)
            counter++
          }
          property int counter: 0
        }
        Action {
          id: rabbit
          text: "Rabbit"
          //アイコンの設定
          icon.source: "rabbit.png"
          //最近使用した項目へ登録
          onTriggered: recentItem.insertRecentItem(rabbit)
        }
      }
      //2階層目のメニュー2つ目
      Menu {
        title: "Place"
        //アクションをまとめるためのグループを定義
        ActionGroup { id: actionGroup }
        Action {
          text: "Farm"              //表示する文字列
          checkable: true           //チェックできるように設定
          checked: true
          ActionGroup.group: actionGroup
        }
        Action {
          text: "Pastry"            //表示する文字列
          checkable: true           //チェックできるように設定
          ActionGroup.group: actionGroup
        }
        Action {
          text: "Park"              //表示する文字列
          checkable: true           //チェックできるように設定
          ActionGroup.group: actionGroup
        }
      }
    }
  }

  //コンテキストメニュー                                    [8]
  Menu {
    id: contextMenu
    Action {
      text: "&Copy"
      onTriggered: message.text = text
    }
    Action {
      text: "&Paste"
      onTriggered: message.text = text
    }
  }

  //クリックエリア
  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.RightButton   //右クリックのみ
    //コンテキストメニューをポップアップ                         [9]
    onClicked: contextMenu.popup(parent)
  }

  //テスト用の文字列を表示
  Label {
    id: message
    anchors.centerIn: parent
    text: "Menu Example"
  }
}
