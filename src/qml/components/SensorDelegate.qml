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

    property Sensors.SensorDataModel sensorModel

    contentItem: RowLayout {
        id: root

        spacing: Kirigami.Units.smallSpacing

        SensorLineChart {
            id: chart
            sensorModel: delegate.sensorModel

            implicitWidth: 150
            implicitHeight: 100
            highlightColor: Kirigami.Theme.highlightColor
        }

        Controls.Label {
            id: labelItem

            text: delegate.text
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            leftPadding: delegate.mirrored ? (delegate.indicator ? delegate.indicator.width : 0) + delegate.spacing : 0
            rightPadding: !delegate.mirrored ? (delegate.indicator ? delegate.indicator.width : 0) + delegate.spacing : 0

            Layout.fillWidth: true
        }
    }
}
