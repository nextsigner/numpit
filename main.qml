import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import Qt.labs.settings 1.1

ApplicationWindow {
    id: app
    visible: true
    visibility: "Windowed"
    color: 'black'
    width: Qt.platform.os==='android'?Screen.width:500
    height: Qt.platform.os==='android'?Screen.height:900
    property int fs: width*0.1
    Settings{
        id: apps
        property color fontColor: 'white'
        property color backgroundColor: 'black'
        property string uFecha
        property string uNom
        property bool numShowFormula: true
    }
    Item{
        id: xApp
        anchors.fill: parent
        NumCiclosVida{
            id: numCiclosVida
            width: parent.width
            height: parent.height
        }
        PanelLog{
            id: panelLog
//            width: app.width
//            height: app.height
//            anchors.centerIn: parent
            anchors.fill: parent
            visible: false
        }
    }

    Shortcut{
        sequence: 'Esc'
        onActivated: Qt.quit()
    }
}
