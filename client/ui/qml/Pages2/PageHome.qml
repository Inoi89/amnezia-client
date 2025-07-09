import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Page {
    id: root
    title: qsTr("SimVPN")

    property string configFile: ""

    Column {
        anchors.centerIn: parent
        spacing: 16

        Button {
            id: importButton
            text: qsTr("Import configuration")
            onClicked: fileDialog.open()
        }

        ConnectButton {
            id: connectBtn
            onClicked: ConnectionController.connectButtonClicked()
        }
    }

    FileDialog {
        id: fileDialog
        nameFilters: ["WireGuard config (*.conf)"]
        onAccepted: {
            ConnectionController.importConfig(fileDialog.currentFile)
        }
    }
}
