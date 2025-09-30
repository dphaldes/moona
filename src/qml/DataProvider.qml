pragma Singleton

import QtQuick
import org.kde.ksysguard.sensors

Item {
    id: sensors

    readonly property Sensor cpuAllUsage: Sensor {
        sensorId: "cpu/all/usage"
        updateRateLimit: 1000
    }

    readonly property SensorDataModel cpuAllUsageModel: SensorDataModel {
        sensors: ["cpu/all/usage"]
        updateRateLimit: 1000
    }

    readonly property Sensor cpuAllTemp: Sensor {
        sensorId: "cpu/all/averageTemperature"
        updateRateLimit: 1000
    }

    readonly property string cpuName: SolidProvider.cpuName
}
