import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ApplicationWindow {
    id: appWindow

    title: i18nc("@title:window", "Moona")
    minimumWidth: Kirigami.Units.gridUnit * 22
    minimumHeight: Kirigami.Units.gridUnit * 20

    property var stackIndex: 0

    globalDrawer: Kirigami.OverlayDrawer {
        id: drawer

        modal: false
        width: Kirigami.Units.gridUnit * 8
        handleVisible: false
        Kirigami.Theme.colorSet: Kirigami.Theme.Header

        Controls.ButtonGroup {
            id: drawerGroup
        }

        contentItem: ColumnLayout {
            id: drawerContent
            spacing: 0

            IconDelegate {
                text: i18n("System")
                icon.name: "speedometer"
                Controls.ButtonGroup.group: drawerGroup
                checked: true
                onClicked: appWindow.stackIndex = 0
            }
            IconDelegate {
                text: i18n("Applications")
                icon.name: "applications-all-symbolic"
                Controls.ButtonGroup.group: drawerGroup
                onClicked: appWindow.stackIndex = 1
            }
            IconDelegate {
                text: i18n("Processes")
                icon.name: "view-process-system-symbolic"
                Controls.ButtonGroup.group: drawerGroup
                onClicked: appWindow.stackIndex = 2
            }
            IconDelegate {
                text: i18n("Services")
                icon.name: "emblem-system-symbolic"
                Controls.ButtonGroup.group: drawerGroup
                onClicked: appWindow.stackIndex = 3
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }

    StackLayout {
        anchors.fill: parent
        anchors.margins: Kirigami.Units.gridUnit

        currentIndex: appWindow.stackIndex

        SystemPage {}
        WorkInProgress {}
        WorkInProgress {}
        WorkInProgress {}
    }
}
