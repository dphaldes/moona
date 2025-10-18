import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import org.kde.ksysguard.sensors as Sensors
import org.kde.ksysguard.formatter
import org.kde.quickcharts as Charts
import org.kde.quickcharts.controls as Charts

Item {
    id: cpuView

    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Kirigami.Heading {
                text: i18n("CPU")
                level: 1
                type: Kirigami.Heading.Type.Primary
                font.pointSize: Kirigami.Theme.defaultFont.pointSize * 2
            }

            Item {
                Layout.fillWidth: true
            }

            Kirigami.Heading {
                text: DataProvider.cpuName
                level: 2
            }
        }

        ClippedRectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            implicitHeight: 200

            color: "transparent"
            radius: Kirigami.Units.cornerRadius

            border {
                color: Kirigami.Theme.highlightColor
                width: 1
            }

            Charts.LineChart {
                id: chart
                anchors.fill: parent

                property Sensors.SensorDataModel sensorModel: DataProvider.cpuAllUsageModel

                fillOpacity: 0.5
                lineWidth: 1
                smooth: true
                stacked: false
                direction: Charts.XYChart.ZeroAtEnd
                yRange.from: 0
                yRange.to: 100

                valueSources: [
                    Charts.HistoryProxySource {
                        interval: chart.sensorModel.updateRateLimit
                        maximumHistory: 60
                        fillMode: Charts.HistoryProxySource.FillFromEnd

                        source: Charts.ModelSource {
                            model: chart.sensorModel
                            roleName: "Value"
                        }
                    }
                ]

                colorSource: Charts.SingleValueSource {
                    value: Kirigami.Theme.highlightColor
                }

                Charts.GridLines {
                    z: -1
                    anchors.fill: parent
                    direction: Charts.GridLines.Horizontal
                    major.visible: false
                    minor.color: Kirigami.Theme.alternateBackgroundColor
                    minor.count: 5
                }

                Charts.GridLines {
                    z: -1
                    anchors.fill: parent
                    direction: Charts.GridLines.Vertical
                    major.visible: false
                    minor.color: Kirigami.Theme.alternateBackgroundColor
                    minor.count: 5
                }
            }
        }

        ColumnLayout {
            Layout.fillHeight: true

            RowLayout {
                ColumnLayout {
                    Kirigami.Heading {
                        text: i18n("Utilization")
                        level: 2
                    }

                    Controls.Label {
                        text: DataProvider.cpuAllUsage.formattedValue
                    }
                }

                ColumnLayout {
                    Kirigami.Heading {
                        text: i18n("Speed")
                        level: 2
                    }

                    Controls.Label {
                        text: DataProvider.cpuAllFrequency.formattedValue
                    }
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
