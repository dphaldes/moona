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

            ClippedRectangle {
                color: "transparent"
                radius: Kirigami.Units.cornerRadius

                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: 60

                border {
                    color: Kirigami.Theme.highlightColor
                    width: 1
                }

                Charts.LineChart {
                    id: memUsed
                    anchors.fill: parent

                    property Sensors.Sensor sensor: DataProvider.memoryUsed

                    fillOpacity: 0.5
                    lineWidth: 1
                    smooth: true
                    stacked: false
                    direction: Charts.XYChart.ZeroAtEnd

                    yRange {
                        automatic: false
                        from: sensor.minimum
                        to: sensor.maximum
                    }

                    valueSources: [
                        Charts.HistoryProxySource {
                            interval: memUsed.sensor.updateRateLimit
                            maximumHistory: 60
                            fillMode: Charts.HistoryProxySource.FillFromEnd

                            source: Charts.SingleValueSource {
                                value: memUsed.sensor.value
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

            ClippedRectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: 60

                color: "transparent"
                radius: Kirigami.Units.cornerRadius

                border {
                    color: Kirigami.Theme.highlightColor
                    width: 1
                }

                Charts.LineChart {
                    id: swapUsed
                    anchors.fill: parent

                    property Sensors.Sensor sensor: DataProvider.swapUsed

                    fillOpacity: 0.5
                    lineWidth: 1
                    smooth: true
                    stacked: false
                    direction: Charts.XYChart.ZeroAtEnd

                    yRange {
                        automatic: false
                        from: sensor.minimum
                        to: sensor.maximum
                    }

                    valueSources: [
                        Charts.HistoryProxySource {
                            interval: swapUsed.sensor.updateRateLimit
                            maximumHistory: 60
                            fillMode: Charts.HistoryProxySource.FillFromEnd

                            source: Charts.SingleValueSource {
                                value: memUsed.sensor.value
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

            ClippedRectangle {
                color: "transparent"
                radius: Kirigami.Units.cornerRadius
                implicitHeight: 40
                Layout.fillWidth: true

                border {
                    color: Kirigami.Theme.highlightColor
                    width: 1
                }

                RowLayout {
                    spacing: 0
                    anchors.fill: parent

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: parent.width * (DataProvider.memoryApplication.value / DataProvider.memoryTotal.value)
                        color: "red"
                        opacity: 0.5
                    }

                    Rectangle {
                        Layout.preferredWidth: parent.width * (DataProvider.memoryCache.value / DataProvider.memoryTotal.value)
                        Layout.fillHeight: true

                        color: "magenta"
                        opacity: 0.5
                    }

                    Item {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
        }

        ColumnLayout {
            Layout.fillHeight: true

            RowLayout {
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Heading {
                    text: i18n("Physical")
                    level: 3
                }

                Item {
                    Layout.fillWidth: true
                }

                Kirigami.TitleSubtitle {
                    title: DataProvider.memoryApplication.formattedValue
                    subtitle: i18n("Used")
                }

                Kirigami.TitleSubtitle {
                    title: DataProvider.memoryTotal.formattedValue
                    subtitle: i18n("Total")
                }

                Kirigami.TitleSubtitle {
                    title: DataProvider.memoryCache.formattedValue
                    subtitle: i18n("Cached")
                }

                Kirigami.TitleSubtitle {
                    title: DataProvider.memoryFree.formattedValue
                    subtitle: i18n("Free")
                }
            }

            RowLayout {
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Heading {
                    text: i18n("Swap")
                    level: 3
                }

                Item {
                    Layout.fillWidth: true
                }

                Kirigami.TitleSubtitle {
                    title: DataProvider.swapUsed.formattedValue
                    subtitle: i18n("Used")
                }

                Kirigami.TitleSubtitle {
                    title: DataProvider.swapTotal.formattedValue
                    subtitle: i18n("Total")
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
