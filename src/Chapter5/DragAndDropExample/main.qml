import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.6 as C1
import QtQuick.Layouts 1.3

ApplicationWindow {
  visible: true
  width: 640;  height: 480
  title: "Drag and Drop Example"

  ColumnLayout {
    anchors.fill: parent
    //プレビューの表示領域
    Rectangle {
      Layout.fillWidth: true                  //できるだけ広げる
      Layout.fillHeight: true                 //できるだけ広げる
      Layout.margins: 3
      border.width: 1                         //表示領域の枠
      border.color: "grey"
      Image {
        id: previewImage
        anchors.fill: parent
        anchors.margins: 3
        fillMode: Image.PreserveAspectFit     //アスペクト比を維持
        smooth: true
      }
    }
    //ドロップした画像の一覧
    ScrollView {
      id: listScroll
      Layout.fillWidth: true                  //できるだけ広げる
      Layout.minimumHeight: parent.height / 3 //親の1/3より小さくしない
      Layout.margins: 3
      RowLayout {
        spacing: 5
        //一覧用のImageをRepeaterで管理
        Repeater {
          id: listRepeater
          model: ListModel { id: listImageModel } //モデルは空の状態から
          delegate: Image {
            //推奨サイズ                   [1]
            Layout.preferredWidth: listScroll.height　*
                                   sourceSize.width / sourceSize.height
            Layout.preferredHeight: listScroll.height
            fillMode: Image.PreserveAspectFit //アスペクト比を維持
            smooth: true
            source: model.source              //画像のパスはモデルから取得
            Item {
              //画像をドラッグ時に動かさないように
              //ダミーエレメントの配置とアンカー固定  [2]
              anchors.fill: parent

              //ドラッグ＆ドロップ関係
              Drag.active: imageDrag.drag.active //ドラッグ機能On
              Drag.dragType: Drag.Automatic      //外部へのドラッグ可 [3]
              Drag.mimeData: {"text/uri-list": source}//MIME情報 [4]

              //ドラッグに必要なマウス処理
              MouseArea {
                id: imageDrag
                anchors.fill: parent
                drag.target: parent
                //ドラッグする対象を指定
                drag.smoothed: true
                //クリックされたらプレビューに表示
                onClicked: previewImage.source = source
              }
            }
          }
          //追加されたらプレビューに表示
          onItemAdded: previewImage.source = item.source
        }
      }
    }
  }
  //ドラッグ状態に反応してことを表す四角
  Rectangle {
    id: dropRect
    anchors.fill: parent
    anchors.margins: 5
    radius: 4
    color: "#000000"
    opacity: 0
    states: State {
      //ドラッグ状態で領域内にいたら背景色と文字色を変更
      when: imageDropArea.containsDrag                  // [5]
      PropertyChanges { target: dropRect; opacity: 0.5 }
      PropertyChanges { target: message; opacity: 1 }
    }
    //ドラッグ状態で領域内にいるときの説明
    Label {
      id: message
      anchors.centerIn: parent
      color: "white"
      text: "Detecting..."
    }
    //ドロップの受付
    DropArea {                                       // [6]
      id: imageDropArea
      anchors.fill: parent
      keys: ["text/uri-list"]       //受け取るデータを絞る // [7]
      onDropped: {                                   // [8]
        if(drop.hasUrls){                            // [9]
          //drop.urlsのパスをプレビュー用のモデルへ追加
          for(var i=0; i<drop.urls.length; i++){
            //簡易的に画像の拡張子に限定
            if(drop.urls[i].indexOf(".bmp") >= 0
                || drop.urls[i].indexOf(".png") >= 0
                || drop.urls[i].indexOf(".jpg") >= 0){
              //モデルへ追加
              listImageModel.append({"source": drop.urls[i]})
            }
          }
        }
      }
    }
  }
}
