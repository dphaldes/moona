/*
    SPDX-FileCopyrightText: 2019 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2019 David Edmundson <davidedmundson@kde.org>
    SPDX-FileCopyrightText: 2019 Arjen Hiemstra <ahiemstra@heimr.nl>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick
import QtQuick.Layouts

import org.kde.kirigami as Kirigami

import org.kde.ksysguard.sensors as Sensors
import org.kde.ksysguard.faces as Faces
import org.kde.ksysguard.formatter as Formatter
import org.kde.quickcharts as Charts

Charts.LineChart {
    id: chart

    required property Sensors.SensorDataModel sensorsModel
    readonly property int historyAmount: 100 // TODO

    direction: Charts.XYChart.ZeroAtEnd

    fillOpacity: 0.8
    interpolate: true

    yRange {
        from: 0
        to: 100
    }

    Instantiator {
        model: sensorsModel.sensors
        delegate: Charts.HistoryProxySource {
            id: history

            source: Charts.ModelSource {
                model: sensorsModel
                column: index
                roleName: "Value"
            }

            interval: sensorsModel.updateRateLimit
            maximumHistory: interval > 0 ? (chart.historyAmount * 1000) / interval : 0
            fillMode: Charts.HistoryProxySource.FillFromEnd
        }
        onObjectAdded: (index, object) => {
            chart.insertValueSource(index, object);
        }
        onObjectRemoved: (index, object) => {
            chart.removeValueSource(object);
        }
    }

    nameSource: Charts.ModelSource {
        roleName: "Name"
        model: sensorsModel
        indexColumns: true
    }
    shortNameSource: Charts.ModelSource {
        roleName: "ShortName"
        model: sensorsModel
        indexColumns: true
    }
}
