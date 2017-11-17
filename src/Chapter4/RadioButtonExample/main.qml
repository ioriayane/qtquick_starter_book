import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
  visible: true
  width: 320
  height: 240
  title: qsTr("Radio Button Example")

  //グループボックス
  GroupBox {
    anchors.centerIn: parent
    //タイトル                          [1]
    title: "Group Box"
    //チェック可能なグループボックス化
    label: CheckBox {
      id: check
      checked: true
      text: "Checkable Group Box"
    }

    //ラジオボタンをまとめるためのグループを定義   [2]
    ButtonGroup {
      id: group
    }

    //ラジオボタンを縦に並べる
    ColumnLayout {
      spacing: 5
      //GroupBoxのチェック状態で使用可不可を決める [3]
      enabled: check.checked

      //1つ目の項目
      RadioButton {
        property int num: 1       //識別用の番号
        text: "Item 1"            //表示する文字列
        ButtonGroup.group: group  //所属するグループの指定   [4]
        checked: true             //1つ目をデフォルト状態にする
      }
      //2つ目の項目
      RadioButton {
        property int num: 2       //識別用の番号
        text: "Item 2"            //表示する文字列
        ButtonGroup.group: group  //所属するグループの指定
      }
      //3つ目の項目
      RadioButton {
        property int num: 3       //識別用の番号
        text: "Item 3"            //表示する文字列
        ButtonGroup.group: group  //所属するグループの指定
      }

      //現在の選択項目を表示 [5]
      Label {
        text: " > %1 : %2".arg(group.checkedButton.num)
                          .arg(group.checkedButton.text)
      }
    }
  }
}
