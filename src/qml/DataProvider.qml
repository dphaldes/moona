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

    readonly property Sensor cpuAllFrequency: Sensor {
        sensorId: "cpu/all/averageFrequency"
        updateRateLimit: 1000
    }

    readonly property Sensor cpuAllTemp: Sensor {
        sensorId: "cpu/all/averageTemperature"
        updateRateLimit: 1000
    }

    readonly property Sensor memoryUsed: Sensor {
        sensorId: "memory/physical/used"
        updateRateLimit: 1000
    }

    readonly property Sensor memoryApplication: Sensor {
        sensorId: "memory/physical/application"
        updateRateLimit: 1000
    }

    readonly property Sensor memoryCache: Sensor {
        sensorId: "memory/physical/cache"
        updateRateLimit: 1000
    }

    readonly property Sensor memoryFree: Sensor {
        sensorId: "memory/physical/free"
        updateRateLimit: 1000
    }

    readonly property Sensor memoryTotal: Sensor {
        sensorId: "memory/physical/total" // doesnt really need to update
    }

    readonly property SensorDataModel memoryUsedModel: SensorDataModel {
        sensors: ["memory/physical/used"]
        updateRateLimit: 1000
    }

    readonly property Sensor swapUsed: Sensor {
        sensorId: "memory/swap/used"
        updateRateLimit: 1000
    }

    readonly property Sensor swapTotal: Sensor {
        sensorId: "memory/swap/total" // doesnt really need to update
    }

    readonly property SensorDataModel swapUsedModel: SensorDataModel {
        sensors: ["memory/swap/used"]
        updateRateLimit: 1000
    }

    readonly property SensorDataModel gpuUsageModel: SensorDataModel {
        sensors: ["gpu/gpu\\\\d+/usage"]
        updateRateLimit: 1000
    }
}
