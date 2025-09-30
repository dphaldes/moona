import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Item {
    id: systempage

    RowLayout {
        anchors.fill: parent

        ColumnLayout {
            Layout.maximumWidth: Kirigami.Units.gridUnit * 16
            spacing: 0

            SensorDelegate {
                sensorModel: DataProvider.cpuAllUsageModel
                type: i18n("CPU")
                name: DataProvider.cpuName
                extra: DataProvider.cpuAllUsage.formattedValue + " (" + DataProvider.cpuAllTemp.formattedValue + ")"
                checked: true
            }

            SensorDelegate {
                sensorModel: DataProvider.memoryUsedModel
                type: i18n("Memory")
                name: DataProvider.memoryUsed.formattedValue + " " + DataProvider.memoryTotal.formattedValue
                extra: ""
            }

            Item {
                Layout.fillHeight: true
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "red"
        }
    }
}
