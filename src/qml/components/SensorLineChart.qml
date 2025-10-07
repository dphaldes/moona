/*
    SPDX-FileCopyrightText: 2019 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2019 David Edmundson <davidedmundson@kde.org>
    SPDX-FileCopyrightText: 2019 Arjen Hiemstra <ahiemstra@heimr.nl>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick

import org.kde.ksysguard.sensors as Sensors
import org.kde.quickcharts as Charts

// TODO: Hide bottom line from the chart
Charts.LineChart {
    id: chart

    required property Sensors.SensorDataModel sensorModel
    required property var highlightColor
    readonly property int historyAmount: 60 // TODO

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
        value: chart.highlightColor
    }

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

    Rectangle {
        color: "transparent"
        anchors.fill: parent
        radius: 5
        border {
            color: chart.highlightColor
            width: 1
        }
    }
}
