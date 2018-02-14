import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3                //追加

ApplicationWindow {
  visible: true
  width: 300
  height: 90
  title: "Layout Example"

  GroupBox {
    anchors.fill: parent
    anchors.margins: 10
    //グループ内のコンテンツより小さくならないように最小値を設定               [1]
    Layout.minimumWidth: content.implicitWidth
    Layout.minimumHeight: content.implicitHeight
    GridLayout {
      id: content
      anchors.fill: parent
      rows: 3                         //グリッドを3行構成        [2]
      columnSpacing: 5                //列の間隔を少し
      rowSpacing: 1                   //行の間隔をほぼなし
      flow: GridLayout.TopToBottom    //グリッドの配置順を上から下へ [3]
      //複数並べるとき用の連番
      Label {
        Layout.rowSpan: 3                 //3行分結合状態      [4]
        Layout.alignment: Qt.AlignVCenter //縦方向の中心に配置   [5]
        text: "1:"
        font.pointSize: 12
      }
      //残り時間
      Label {
        id: remainTime
        Layout.rowSpan: 2         //2行分結合状態
        clip: true
        text: "05:59:59"
        font.pointSize: 16
      }
      //進捗バー
      ProgressBar {
        Layout.fillWidth: true    //横方向に可能な限り広げる      [6]
        Layout.maximumHeight: 8   //最大の高さとして8を指定       [7]
        Layout.columnSpan: 3      //3列分結合状態             [8]
        from: 0
        to: 100
        value: 90
      }
      //セパレータ
      Label {
        Layout.rowSpan: 2         //2行分結合状態
        text: "-"
        font.pointSize: 10
      }
      //終了予定日
      Label {
        text: "08/17"
        font.pointSize: 8
      }
      //終了予定時刻
      Label {
        text: "16:00:00"
        font.pointSize: 8
      }
      //開始ボタン
      Button {
        Layout.fillWidth: true    //許される限り横に広げる         [9]
        Layout.minimumWidth: 50   //最小サイズを指定            [10]
        Layout.rowSpan: 3         //3行分結合状態
        text: "Start"
      }
      //設定ボタン
      Button {
        Layout.preferredWidth: 50 //推奨サイズを指定            [11]
        Layout.rowSpan: 3         //3行分結合状態
        text: "Set"
      }
    }
  }
}
