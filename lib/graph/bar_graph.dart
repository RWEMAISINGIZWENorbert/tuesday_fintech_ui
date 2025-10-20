import 'package:flutter/material.dart';
import 'package:tuesday_fintech_ui/graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';

class BarGraph extends StatelessWidget {

  const BarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: 12, 
      monAmount: 40, 
      tueAmount: 25, 
      wedAmount: 70, 
      thurAmount: 90, 
      friAmount: 60, 
      sutAmount: 30 
    );
    myBarData.initBarData();
   
   final maxY = 90;
    final minY = 12;
    
    // Set Y-axis range to accommodate both positive and negative values
    final yAxisMax = (maxY > 0 ? maxY * 1.2 : 1.0).toDouble();
    final yAxisMin = (minY < 0 ? minY * 1.2 : 0.0).toDouble();

    return BarChart(
      BarChartData(
        maxY: yAxisMax,
        minY: yAxisMin,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              // color: minY <= 0 ? Colors.red.withOpacity(0.5) : Colors.grey.withOpacity(0.2),
              color: Colors.transparent,
              strokeWidth: value == 0 ? 2 : 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => getBottomTiles(value, meta, context),
            ),
          )
        ),
        barGroups: myBarData.barData.map(
          (data) => BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y,
                color: data.y == 90 ? Color(0xFF4B2AD6) : Colors.grey[400],
                width: 22,
                borderRadius: BorderRadius.circular(10)
              )
            ]
          )
        ).toList(),
      ),
    );
  }
}

Widget getBottomTiles(double value, TitleMeta meta, BuildContext context) {
  final style = TextStyle(
    color: Theme.of(context).hintColor,
    fontWeight: FontWeight.bold, 
  );

  Widget text;
  switch(value.toInt()) {
    case 0: text = Text('jan', style: style); break;
    case 1: text = Text('feb', style: style); break;
    case 2: text = Text('mar', style: style); break;
    case 3: text = Text('Apr', style: style); break;
    case 4: text = Text('Jun', style: style); break;
    case 5: text = Text('Jul', style: style); break;
    // case 6: text = Text('sat', style: style); break;
    default: text = const Text(''); break;
  }

  return SideTitleWidget(meta: meta, child: text);
}