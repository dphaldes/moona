import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.Moona as Moona

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

            Moona.IconDelegate {
                text: i18n("System")
                icon.name: "speedometer"
                Controls.ButtonGroup.group: drawerGroup
                checked: true
                onPressed: appWindow.stackIndex = 0
            }
            Moona.IconDelegate {
                text: i18n("System")
                icon.name: "speedometer"
                Controls.ButtonGroup.group: drawerGroup
                onPressed: appWindow.stackIndex = 1
            }
            Moona.IconDelegate {
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
        SomePage {}
    }
}
