import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
  visible: true
  width: 300
  height: 240
  title: "Layout Example 2"

  GridLayout {
    anchors.fill: parent
    anchors.margins: 5
    columns: 2
    rowSpacing: 5
    columnSpacing: 5

    Rectangle {
      border.color: "black"
      border.width: 1
      Layout.fillWidth: true      //目一杯広げる
      Layout.fillHeight: true
      Layout.preferredWidth: 50   //推奨サイズを50
      Layout.preferredHeight: 50
      Label { anchors.centerIn: parent; text: "rect1" }
    }
    Rectangle {
      border.color: "black"
      border.width: 1
      Layout.fillWidth: true      //目一杯広げる
      Layout.fillHeight: true
      Layout.preferredWidth: 50   //推奨サイズを50
      Layout.preferredHeight: 50
      Label { anchors.centerIn: parent; text: "rect2" }
    }
    Rectangle {
      border.color: "black"
      border.width: 1
      Layout.fillWidth: true      //目一杯広げる
      Layout.fillHeight: true
      Layout.preferredWidth: 50   //推奨サイズを50
      Layout.preferredHeight: 50
      Label { anchors.centerIn: parent; text: "rect3" }
    }
    Rectangle {
      border.color: "black"
      border.width: 1
      Layout.fillWidth: true      //目一杯広げる
      Layout.fillHeight: true
      Layout.preferredWidth: 150  //この四角形だけ推奨サイズを大きく設定
      Layout.preferredHeight: 150
      Label { anchors.centerIn: parent; text: "rect4" }
    }
  }
}
