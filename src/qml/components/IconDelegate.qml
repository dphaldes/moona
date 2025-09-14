import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.delegates as Delegates

Delegates.RoundedItemDelegate {
        id: delegate

        padding: Kirigami.Units.largeSpacing
        Layout.fillWidth: true
        checkable: true
        icon.height: 32
        icon.width: 32

        contentItem: ColumnLayout {
            id: root

            spacing: Kirigami.Units.smallSpacing

            Kirigami.Icon {
                id: iconItem

                Layout.alignment: Qt.AlignHCenter
                source: delegate.icon.name
                Layout.preferredHeight: delegate.icon.width
                Layout.preferredWidth: delegate.icon.height
            }

            Controls.Label {
                id: labelItem

                leftPadding: delegate.mirrored ? (delegate.indicator ? delegate.indicator.width : 0) + delegate.spacing : 0
                rightPadding: !delegate.mirrored ? (delegate.indicator ? delegate.indicator.width : 0) + delegate.spacing : 0
                text: delegate.text
                font: delegate.font
                color: delegate.enabled ? Kirigami.Theme.textColor : Kirigami.Theme.disabledTextColor
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignLeft
                Layout.fillWidth: true
                Accessible.ignored: true
            }
        }
    }