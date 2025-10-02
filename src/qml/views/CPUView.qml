import QtQuick
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import org.kde.quickcharts as Charts
import org.kde.ksysguard.sensors as Sensors

Item {
    id: cpuView
    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Kirigami.Heading {
                text: "CPU"
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

        Charts.LineChart {
            id: chart

            fillOpacity: 0.5
            lineWidth: 1
            smooth: true
            stacked: false
            direction: Charts.XYChart.ZeroAtEnd

            Layout.fillWidth: true
            Layout.fillHeight: true

            property Sensors.SensorDataModel model: DataProvider.cpuAllUsageModel

            yRange {
                from: 0
                to: 100
            }

            colorSource: Charts.SingleValueSource {
                value: Kirigami.Theme.highlightColor
            }

            Instantiator {
                model: chart.model.sensors
                delegate: Charts.HistoryProxySource {
                    id: history

                    source: Charts.ModelSource {
                        model: model
                        column: index
                        roleName: "Value"
                    }

                    interval: chart.model.updateRateLimit
                    maximumHistory: 60
                    fillMode: Charts.HistoryProxySource.FillFromEnd
                }
                onObjectAdded: (index, object) => {
                    chart.insertValueSource(index, object);
                }
                onObjectRemoved: (index, object) => {
                    chart.removeValueSource(object);
                }
            }

            Rectangle {
                color: "transparent"
                anchors.fill: parent
                radius: 5
                border {
                    color: Kirigami.Theme.highlightColor
                    width: 1
                }
            }
        }
    }
}
