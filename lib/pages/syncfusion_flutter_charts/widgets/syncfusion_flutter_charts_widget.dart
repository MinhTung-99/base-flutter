import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncFusionFlutterChartsWidget extends StatelessWidget {
  const SyncFusionFlutterChartsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return syncfusionFlutterChartsWidget(context);
  }

  Widget syncfusionFlutterChartsWidget(BuildContext context) {
    const maxXCount = 100.0;
    final List<double> tooltip = [0, 1000];
    final List<double> yAxis = [0, 1000];

    return SfCartesianChart(
        borderWidth: 10,
        margin: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
        plotAreaBorderWidth: 0,
        onDataLabelRender: (dataLabelArgs) {
         // print('$dataLabelArgs  data');
        },

        primaryXAxis: const NumericAxis(
            majorGridLines: MajorGridLines(),
            majorTickLines: MajorTickLines(width: 1),
            isVisible: false,
            //show trục
            minimum: 0,
            maximum: maxXCount,
            interval: 1),

        primaryYAxis: NumericAxis(
          isVisible: false,
          labelStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.red, fontSize: 12),
          //kẻ ngang
          maximum: tooltip.last,
          minimum: tooltip.first,
          interval: 10,
        ),

        axes: <ChartAxis>[
          NumericAxis(
              isVisible: false,
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.red, fontSize: 12),
              borderWidth: 0,
              majorGridLines: const MajorGridLines(width: 0),
              majorTickLines: const MajorTickLines(width: 0),
              maximum: yAxis.last,
              minimum: yAxis.first,
              name: 'yAxis',
              opposedPosition: true,
              interval: 10)
        ],
        series: <LineSeries<DataTest, double>>[
          LineSeries<DataTest, double>(
            dataSource: [
              DataTest(20, 150), DataTest(70, 500)
            ],
            width: 2,
            animationDuration: 0,
            markerSettings: const MarkerSettings(
              borderColor: Colors.amber,
              color: Colors.blue,
              borderWidth: 0,
              width: 6,
              height: 6,
              isVisible: true, // Hiển thị marker
            ),
            color: Colors.brown,

            xValueMapper: (DataTest sales, _) => sales.xValueMapper,
            yValueMapper: (DataTest sales, _) => sales.yValueMapper, //height
          ),
          LineSeries<DataTest, double>(
            dataSource: [
              DataTest(1, 100),
              DataTest(15, 700),
            ],
            animationDuration: 0,
            width: 2,
            enableTooltip: false,
            yAxisName: 'yAxis',
            isVisibleInLegend: false,
            onPointTap: (pointInteractionDetails) {
              //print('Click vào point');
            },
            color: Colors.red,
            markerSettings: const MarkerSettings(
              borderWidth: 0,
              borderColor: Colors.cyanAccent,
              width: 6,
              height: 6,
              color: Colors.deepPurpleAccent,
              isVisible: true, // Hiển thị marker
            ),
            xValueMapper: (DataTest sales, _) => sales.xValueMapper,
            yValueMapper: (DataTest sales, _) => sales.yValueMapper, //weight
          ),
        ]);
  }
}

class DataTest {
  DataTest(this.xValueMapper, this.yValueMapper);

  final double xValueMapper;
  final double yValueMapper; //height or weight
}
