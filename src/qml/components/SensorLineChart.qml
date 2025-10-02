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
        value: highlightColor
    }

    Instantiator {
        model: chart.sensorModel.sensors
        delegate: Charts.HistoryProxySource {
            id: history

            source: Charts.ModelSource {
                model: sensorModel
                column: index
                roleName: "Value"
            }

            interval: sensorModel.updateRateLimit
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
            color: chart.highlightColor
            width: 1
        }
    }
}
