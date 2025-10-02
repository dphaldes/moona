import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.delegates as Delegates

Delegates.RoundedItemDelegate {
    id: delegate

    checkable: true
    icon.height: 32
    icon.width: 32

    Layout.fillWidth: true

    contentItem: ColumnLayout {
        id: root

        spacing: Kirigami.Units.smallSpacing

        Kirigami.Icon {
            id: iconItem

            source: delegate.icon.name

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: delegate.icon.width
            Layout.preferredWidth: delegate.icon.height
        }

        Controls.Label {
            id: labelItem
            text: delegate.text

            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            Layout.fillWidth: true
        }
    }
}
