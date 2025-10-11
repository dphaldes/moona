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
                text: i18n("Memory")
                level: 1
                type: Kirigami.Heading.Type.Primary
                font.pointSize: Kirigami.Theme.defaultFont.pointSize * 2
            }

            Item {
                Layout.fillWidth: true
            }

            Kirigami.Heading {
                text: DataProvider.memoryTotal.formattedValue
                level: 2
            }
        }

        ColumnLayout {
            spacing: Kirigami.Units.mediumSpacing

            Charts.LineChart {

                fillOpacity: 0.5
                lineWidth: 1
                smooth: true
                stacked: false
                direction: Charts.XYChart.ZeroAtEnd

                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: 80

                valueSources: [
                    Charts.HistoryProxySource {
                        interval: DataProvider.memoryUsedModel.updateRateLimit
                        maximumHistory: 60
                        fillMode: Charts.HistoryProxySource.FillFromEnd

                        source: Charts.ModelSource {
                            model: DataProvider.memoryUsedModel
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

                Rectangle {
                    z: 1
                    color: "transparent"
                    anchors.fill: parent
                    radius: 5

                    border {
                        color: Kirigami.Theme.highlightColor
                        width: 1
                    }
                }
            }

            Charts.LineChart {
                fillOpacity: 0.5
                lineWidth: 1
                smooth: true
                stacked: false
                direction: Charts.XYChart.ZeroAtEnd

                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: 60

                valueSources: [
                    Charts.HistoryProxySource {
                        interval: DataProvider.swapUsedModel.updateRateLimit
                        maximumHistory: 60
                        fillMode: Charts.HistoryProxySource.FillFromEnd

                        source: Charts.ModelSource {
                            model: DataProvider.swapUsedModel
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

                Rectangle {
                    z: 1
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
