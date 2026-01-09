import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.ksysguard.sensors as Sensors

Item {
    id: systempage

    property var stackIndex: 0

    RowLayout {
        anchors.fill: parent
        spacing: Kirigami.Units.gridUnit

        Controls.ButtonGroup {
            id: buttonGroup
        }

        ColumnLayout {
            Layout.maximumWidth: Kirigami.Units.gridUnit * 16
            spacing: 0

            SensorDelegate {
                sensor: DataProvider.cpuAllUsage
                type: i18n("CPU")
                name: SolidDataProvider.cpuName
                extra: DataProvider.cpuAllUsage.formattedValue + " (" + DataProvider.cpuAllTemp.formattedValue + ")"
                checked: true
                Controls.ButtonGroup.group: buttonGroup
                onPressed: systempage.stackIndex = 0
            }

            SensorDelegate {
                sensor: DataProvider.memoryUsed
                type: i18n("Memory")
                name: DataProvider.memoryUsed.formattedValue + " " + DataProvider.memoryTotal.formattedValue
                extra: ""
                Controls.ButtonGroup.group: buttonGroup
                onPressed: systempage.stackIndex = 1
            }
            
            // Repeater {
            //     model: GpuDataProvider.gpus
                
            //     SensorDelegate {
            //         required property Sensors.SensorDataModel sensorModel
            //         sensor: sensorModel
            //         type: i18n("GPU")
            //         name: "HAHAHAH"
            //         extra: ""
            //         Controls.ButtonGroup.group: buttonGroup
            //         // onPressed: systempage.stackIndex = 1
            //     }
                
            // }

            // SensorDelegate {
            //     sensorModel: DataProvider.gpuUsageModel
            //     type: i18n("GPU")
            //     name: "lmaoe"
            //     extra: ""
            //     Controls.ButtonGroup.group: buttonGroup
            //     onPressed: systempage.stackIndex = 1
            // }

            Item {
                Layout.fillHeight: true
            }
        }

        Kirigami.Separator {
            Layout.fillHeight: true
        }

        StackLayout {
            currentIndex: systempage.stackIndex

            CPUView {}
            MemoryView {}

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "aqua"
            }
        }
    }
}
