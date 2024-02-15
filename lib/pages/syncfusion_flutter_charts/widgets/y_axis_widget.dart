
import 'package:flutter/material.dart';

class YAxisWidget extends StatelessWidget {

  const YAxisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var minY = 40;
    var maxY = 120;
    return SizedBox(
      width: 40,
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
                      child: SizedBox(
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
                                  child: Text('$value',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
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