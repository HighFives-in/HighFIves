import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//As of now supporting 6 will see later or generate colors randomly
List pieColors = [
  Colors.orange,
  Colors.blue,
  Colors.purple,
  Colors.green,
  Colors.yellow,
  Colors.teal,
  Colors.black,
];

class PieData {
  PieData(this.title, this.value, this.color);
  final String title;
  final int value;
  final Color color;
}

class BuildPieChart extends StatefulWidget {
  List<PieData> _listOfData;
  final String _title;
  BuildPieChart(this._title, this._listOfData);
  @override
  _BuildPieChartState createState() => _BuildPieChartState();
}

class _BuildPieChartState extends State<BuildPieChart> {
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        elevation: 5,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget._title != null
                ? Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      widget._title.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                : Text(''),
            Expanded(
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: PieChart(
                        PieChartData(
                            pieTouchData:
                                PieTouchData(touchCallback: (pieTouchResponse) {
                              setState(() {
                                if (pieTouchResponse.touchInput
                                        is FlLongPressEnd ||
                                    pieTouchResponse.touchInput is FlPanEnd) {
                                  touchedIndex = -1;
                                } else {
                                  touchedIndex =
                                      pieTouchResponse.touchedSectionIndex;
                                }
                              });
                            }),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 60,
                            sections:
                                _buildPieGraphFromData(widget._listOfData)),
                      ),
                    ),
                  ),
                  _buildColorIndicatorWithTitle(widget._listOfData),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildColorIndicatorWithTitle(List<PieData> listOfData) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listOfData
          .asMap()
          .map((index, data) {
            return MapEntry(
                index,
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Container(
                        color:
                            data.color != null ? data.color : pieColors[index],
                        width: 20,
                        height: 20,
                      ),
                      Text(listOfData[index].title),
                    ],
                  ),
                ));
          })
          .values
          .toList(),
    );
  }

  List<PieChartSectionData> _buildPieGraphFromData(List<PieData> listOfData) {
    int valueTotal = 0;
    listOfData.forEach((element) {
      valueTotal += element.value;
    });
    return List.generate(listOfData.length, (i) {
      final isTouched = i == touchedIndex;
      var data = listOfData[i];
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      return PieChartSectionData(
        color: data.color != null ? data.color : pieColors[i],
        value: data.value.toDouble(),
        title: num.parse(((data.value / valueTotal) * 100).toStringAsFixed(2))
                .toString() +
            '%',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
      );
    });
  }
}
