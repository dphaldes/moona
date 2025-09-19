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
        width: Kirigami.Units.gridUnit * 10
        handleVisible: false

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
                onPressed: appWindow.stackIndex = 0
            }
            IconDelegate {
                text: i18n("System")
                icon.name: "speedometer"
                Controls.ButtonGroup.group: drawerGroup
                onPressed: appWindow.stackIndex = 1
            }
            IconDelegate {
                text: i18n("System")
                icon.name: "speedometer"
                Controls.ButtonGroup.group: drawerGroup
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }

    StackLayout {
        anchors.fill: parent
        currentIndex: appWindow.stackIndex

        SystemPage {}
        WorkInProgress {}
    }
}
