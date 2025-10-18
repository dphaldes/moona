/*
    SPDX-FileCopyrightText: 2019 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2019 David Edmundson <davidedmundson@kde.org>
    SPDX-FileCopyrightText: 2019 Arjen Hiemstra <ahiemstra@heimr.nl>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick

import org.kde.kirigami as Kirigami
import org.kde.ksysguard.sensors as Sensors
import org.kde.quickcharts as Charts

// TODO: Hide bottom line from the chart

ClippedRectangle {
    id: root
    color: "transparent"
    radius: Kirigami.Units.cornerRadius
    border {
        color: highlightColor
        width: 1
    }

    required property Sensors.SensorDataModel sensorModel
    required property var highlightColor
    readonly property int historyAmount: 60 // TODO

    Charts.LineChart {
        id: chart
        anchors.fill: parent

        fillOpacity: 0.5
        lineWidth: 0.5
        smooth: true
        stacked: false
        direction: Charts.XYChart.ZeroAtEnd

        yRange {
            from: 0
            to: 100
        }

        colorSource: Charts.SingleValueSource {
            value: root.highlightColor
        }

        valueSources: [
            Charts.HistoryProxySource {
                interval: root.sensorModel.updateRateLimit
                maximumHistory: 60
                fillMode: Charts.HistoryProxySource.FillFromEnd

                source: Charts.ModelSource {
                    model: root.sensorModel
                    roleName: "Value"
                }
            }
        ]
    }
}
