pragma Singleton

import QtQuick
import org.kde.ksysguard.sensors as Sensors

Item {
    id: sensors

    readonly property Sensors.SensorDataModel cpu_all_usage: Sensors.SensorDataModel {
        id: cpu_usage_model
        sensors: ["cpu/all/usage"]
        updateRateLimit: 500
    }
}
