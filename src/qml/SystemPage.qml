import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Item {
    id: systempage

    RowLayout {
        anchors.fill: parent

        ColumnLayout {
            Layout.maximumWidth: Kirigami.Units.gridUnit * 12
            spacing: 0

            SensorDelegate {
                sensorModel: DataProvider.cpu_all_usage
                text: DataProvider.cpu_name
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
