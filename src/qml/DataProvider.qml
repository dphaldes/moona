pragma Singleton

import QtQuick
import org.kde.ksysguard.sensors as Sensors

Item {
    id: sensors

    readonly property Sensors.SensorDataModel cpu_all_usage: Sensors.SensorDataModel {
        sensors: ["cpu/all/usage"]
        updateRateLimit: 500
    }

    readonly property string cpu_name: SolidProvider.cpuName
}
