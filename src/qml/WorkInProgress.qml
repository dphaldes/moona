import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Item {
    id: page

    ColumnLayout {
        anchors.centerIn: parent
        Kirigami.Icon {
            source: "document-edit-sign"
            Layout.alignment: Qt.AlignHCenter
        }

        Kirigami.Heading {
            text: i18n("Page work in progress")
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
