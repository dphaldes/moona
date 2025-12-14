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

            SensorLineChart {
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: 60

                sensor: DataProvider.memoryUsed
                highlightColor: Kirigami.Theme.highlightColor
                chart.lineWidth: 1

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

            SensorLineChart {
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: 60

                sensor: DataProvider.swapUsed
                highlightColor: Kirigami.Theme.highlightColor
                chart.lineWidth: 1

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
