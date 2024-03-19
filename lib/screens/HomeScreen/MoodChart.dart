import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MoodChart extends StatefulWidget {
  MoodChart({super.key, required this.time, required this.moodId});

  List<String> time;
  List<int> moodId;

  @override
  State<MoodChart> createState() => _MoodChartState();
}

class _MoodChartState extends State<MoodChart> {
  bool start = true;
  int touchedIndex = -1;
  List<double> moodLength = [5, 7, 9, 11, 13];
  List<Color> moodColors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue];
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        start = false;
      });
    });
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: BarChart(
        start ? barData(zeroGroups()) : barData(showingGroups()),
        swapAnimationCurve: Curves.decelerate,
        swapAnimationDuration: Duration(milliseconds: 500),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 22
  }) {
    barColor ??= Colors.grey;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Colors.purpleAccent : barColor,
          width: width,
          borderSide: isTouched ? BorderSide(color: Colors.purple) : BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.white
          )
        )
      ]
    );
  }

  List<BarChartGroupData> showingGroups() {
    List<BarChartGroupData> data = [];
    for(int i = 0; i < widget.moodId.length; i++) {
      data.add(makeGroupData(i, moodLength[widget.moodId[i]], isTouched: i == touchedIndex, barColor: moodColors[widget.moodId[i]]));
    }
    return data;
  }

  List<BarChartGroupData> zeroGroups() {
    List<BarChartGroupData> data = [];
    for(int i = 0; i < widget.moodId.length; i++) {
      data.add(makeGroupData(i, 0, isTouched: i == touchedIndex, barColor: moodColors[widget.moodId[i]]));
    }
    return data;
  }

  BarChartData barData(List<BarChartGroupData> data) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if(!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        }
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getTitles,
              reservedSize: 38,
            )
          )
        ),
      borderData:  FlBorderData(
        show: false
      ),
      barGroups: data,
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text = Text(widget.time[value.toInt()], style: style,);
    return SideTitleWidget(axisSide: meta.axisSide, space: 16, child: text,);
  }
}
