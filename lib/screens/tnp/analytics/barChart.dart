import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartDataModel {
  BarChartDataModel(this.title, this.value, this.color);
  final String title;
  final int value;
  final Color color;
}

class BuildBarChart extends StatefulWidget {
  List<BarChartDataModel> _listOfData;
  final String _title;
  BuildBarChart(this._title, this._listOfData);
  @override
  _BuildBarChartState createState() => _BuildBarChartState();
}

class _BuildBarChartState extends State<BuildBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          // side: BorderSide(color: Theme.of(context).accentColor, width: 1),
        ),
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: [
            BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: _getMaxValFromData(widget._listOfData) + 10.toDouble(),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) =>
                        Theme.of(context).textTheme.headline6,
                    margin: 20,
                    getTitles: (double value) {
                      return widget._listOfData[value.toInt()].title;
                    },
                  ),
                  leftTitles: SideTitles(showTitles: false),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: widget._listOfData
                    .asMap()
                    .map((index, value) {
                      return MapEntry(
                        index,
                        BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                                y: widget._listOfData[index].value.toDouble(),
                                colors: [
                                  Colors.lightBlueAccent,
                                  Colors.greenAccent
                                ])
                          ],
                          showingTooltipIndicators: [0],
                        ),
                      );
                    })
                    .values
                    .toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                widget._title.toUpperCase(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getMaxValFromData(List<BarChartDataModel> dataList) {
    int mx = -1;
    dataList.forEach((element) {
      mx = max(mx, element.value);
    });
    return mx;
  }
}
/*
 */
