import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    property bool on: false
    implicitHeight: implicitWidth
    implicitWidth: text1.implicitWidth + 10

    Rectangle {
        id: rectangle1
        radius: height / 2
        gradient: Gradient {
            GradientStop {
                id: gradientStop1
                position: 0
                color: "#bd0707"
            }
            GradientStop {
                id: gradientStop2
                position: 1
                color: "#000000"
            }
        }
        anchors.fill: parent
        Text {
            id: text1
            x: 130
            y: 79
            color: "#ffffff"
            text: qsTr("OFF")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }
    }
    states: [
        State {
            name: "on"
            when: on
            PropertyChanges {
                target: gradientStop1
                color: "#9498d9"
            }
            PropertyChanges {
                target: gradientStop2
                color: "#0f179e"
            }
            PropertyChanges {
                target: text1
                text: qsTr("ON")
            }
        }
    ]
}
