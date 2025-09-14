import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.Moona as Moona
import org.kde.ksysguard.sensors as Sensors

Item {
    id: systempage

    // RowLayout {
    //     anchors.fill: parent

    //     ColumnLayout {
    //         implicitWidth: Kirigami.Units.gridUnit * 10

    //         Controls.ButtonGroup {
    //             id: buttonGroup
    //         }

    //         Moona.IconDelegate {
    //             text: i18n("CPU")
    //             icon.name: "cpu"
    //             Controls.ButtonGroup.group: buttonGroup
    //         }

    //         Item {
    //             Layout.fillHeight: true
    //         }
    //     }

    //     Rectangle {
    //         Layout.fillWidth: true
    //         Layout.fillHeight: true
    //         color: "lightblue"
    //     }
    // }
    //

    Sensors.SensorDataModel {
        id: cpu_usage_model
        sensors: ["cpu/all/usage"]
        updateRateLimit: 1000
    }

    Moona.SensorLineChart {
        id: chart
        sensorModel: cpu_usage_model
        highlightColor: Kirigami.Theme.highlightColor
        width: 400
        height: 300
        anchors.leftMargin: 20
    }
}
