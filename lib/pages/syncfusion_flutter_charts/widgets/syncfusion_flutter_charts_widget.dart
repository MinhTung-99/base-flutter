import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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

    return SizedBox(
      width: 350,
      child: SfCartesianChart(
          borderWidth: 10,
          margin: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
          plotAreaBorderWidth: 1,
          onDataLabelRender: (dataLabelArgs) {
            print('$dataLabelArgs  data');
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
            isVisible: true,
            labelStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.red, fontSize: 12),
            //kẻ ngang
            maximum: 1000,
            minimum: tooltip.first,
            interval: 10,
          ),
          axes: <ChartAxis>[
            NumericAxis(
                isVisible: true,
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
                DataTest(1, 100), DataTest(10, 700)
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

              xValueMapper: (DataTest sales, _) => sales.month,
              yValueMapper: (DataTest sales, _) => sales.typeGrowth, //height
            ),
            LineSeries<DataTest, double>(
              dataSource: [
                DataTest(1, 100),
                DataTest(15, 700),
                // DataTest(20, 300),
                // DataTest(10, 20)
              ],
              animationDuration: 0,
              width: 2,
              enableTooltip: false,
              yAxisName: 'yAxis',
              isVisibleInLegend: false,
              onPointTap: (pointInteractionDetails) {
                print('Click vào point');
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
              xValueMapper: (DataTest sales, _) => sales.month,
              yValueMapper: (DataTest sales, _) => sales.typeGrowth, //weight
            ),
          ]),
    );
  }

  List<DataTest> getListHeighOrWeight() {
    List<DataTest> list = [];

    //if (viewModel.typeAge.value == GrowAgeType.less6years) {
    _getHeightOrWeight(Rx(["10", "20"]), list);
    // } else if (viewModel.typeAge.value == GrowAgeType.less12years) {
    //   _getHeightOrWeight(viewModel.growthSummariesLess12years, list,
    //       GrowAgeType.less12years, typeGrowthGraph);
    // } else {
    //   _getHeightOrWeight(viewModel.growthSummariesLess18years, list,
    //       GrowAgeType.less18years, typeGrowthGraph);
    // }

    return list;
  }

  void _getHeightOrWeight(
    Rx<List<String>?> listGrowth,
    List<DataTest> list,
    /*GrowAgeType type, TypeGrowthGraph typeGrowthGraph*/
  ) {
    listGrowth.value
        ?.map((data) {
          final height = double.parse("100");
          final weight = double.parse("200");
          //final years = /*data.ageMonth.toString().split('/')*/ 20;
          //final months = years[1].split('/');
          var month = (20 -
              // (type == GrowAgeType.less6years
              //     ? 0
              //     : type == GrowAgeType.less12years
              //     ? 6
              //     : 12)) *
              // 12.0) +
              double.parse("18"));

          return DataTest(month, height);
        })
        .toList()
        .forEach((element) => list.addIf(element.typeGrowth > 0,
            element)); //chi them khi (height|| weight)> 0
  }
}

class DataTest {
  DataTest(this.month, this.typeGrowth);

  final double month;
  final double typeGrowth; //height or weight
}
