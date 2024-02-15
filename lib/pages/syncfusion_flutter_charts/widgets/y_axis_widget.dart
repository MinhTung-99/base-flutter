
import 'package:flutter/material.dart';

class YAxisWidget extends StatelessWidget {

  const YAxisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var minY = 40;
    var maxY = 120;
    return Container(
      width: 40,
      // margin: const EdgeInsets.only(bottom: 9),
      // decoration: BoxDecoration(
      //     border: Border(
      //       right: typeGrowthGraph == TypeGrowthGraph.height
      //           ? const BorderSide(color: lineTopColor, width: 2)
      //           : BorderSide.none,
      //       left: typeGrowthGraph == TypeGrowthGraph.weight
      //           ? const BorderSide(color: lineTopColor, width: 2)
      //           : BorderSide.none,
      //     )),
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final maxHeight = constraints.maxHeight;
                  final itemCount = maxY > minY ? ((maxY - minY) ~/ 10) + 1 : 0;
                  final itemHeight = maxHeight / (itemCount + 1);
                  return Column(children: [
                    SizedBox(height: itemHeight / 2),
                    Expanded(
                      child: Container(
                        // margin: typeGrowthGraph == TypeGrowthGraph.height
                        //     ? const EdgeInsets.only(right: 10)
                        //     : const EdgeInsets.only(left: 10),
                        width: 40,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: itemCount,
                          itemBuilder: (BuildContext context, int index) {
                            int value = (maxY - (index * 10)).round();
                            return SizedBox(
                              height: itemHeight,
                              child: Align(
                                  // alignment:
                                  // typeGrowthGraph == TypeGrowthGraph.height
                                  //     ? Alignment.centerRight
                                  //     : Alignment.centerLeft,
                                  child: Text('$value',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                          // color: typeGrowthGraph ==
                                          //     TypeGrowthGraph.height
                                          //     ? colorHeightGrowth
                                          //     : colorWeithGrowth,
                                          fontSize: 12))),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: itemHeight / 2),
                  ]);
                }),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.all(2),
                  // color: typeGrowthGraph == TypeGrowthGraph.height
                  //     ? colorHeightGrowth
                  //     : colorWeithGrowth,
                  child: Wrap(
                    children: [
                      FittedBox(
                          child: Text(
                            'ABC',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 12, color: Colors.black),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}