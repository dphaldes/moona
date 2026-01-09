import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.delegates as Delegates
import org.kde.ksysguard.sensors as Sensors

Delegates.RoundedItemDelegate {
    id: delegate

    checkable: true
    padding: Kirigami.Units.largeSpacing

    Layout.fillWidth: true

    required property Sensors.Sensor sensor
    required property string type
    required property string name
    required property string extra

    contentItem: RowLayout {
        id: root

        spacing: Kirigami.Units.smallSpacing

        SensorLineChart {
            id: chart
            sensor: delegate.sensor

            implicitWidth: 120
            implicitHeight: 80
            highlightColor: Kirigami.Theme.highlightColor
        }

        ColumnLayout {
            Controls.Label {
                id: type

                text: delegate.type
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Controls.Label {
                id: name

                text: delegate.name
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Controls.Label {
                id: extra

                text: delegate.extra
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
        }
    }
}
