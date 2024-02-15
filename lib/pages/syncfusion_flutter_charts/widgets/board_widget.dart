
import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key, required this.itemWith});
  final double itemWith;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: index == 0
                          ? const BorderSide(
                          width: 1.0, color: Colors.red)
                          : BorderSide.none,
                      right: const BorderSide(
                          width: 1.0, color: Colors.red),
                    ),
                    color: Colors.blue,
                  ),
                  height: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: itemWith / 2),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 11,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Container(
                                color: Colors.blue,
                                width: itemWith,
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                        height: 1.5),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: index > 1
                              //       ? index > 8 //so co 2 c/so
                              //           ? index == 10 // month= 11
                              //               ? 18.9
                              //               : index == 11 //month=12
                              //                   ? 0
                              //                   : 9.5 //month=10
                              //           : index > 4
                              //               ? index == 8 //month=9
                              //                   ? 17
                              //                   : 18.5
                              //               : 18 //month= 3,4,5,6,7,8
                              //       : 18.4, //month = 1,2
                              // ),
                            ],
                          );
                        },
                      ),
                      SizedBox(width: itemWith / 2),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: index == 0
                          ? const BorderSide(
                          width: 1.0, color: Colors.red)
                          : BorderSide.none,
                      right: const BorderSide(
                          width: 1.0, color: Colors.red),
                      top: const BorderSide(
                          width: 1.0, color: Colors.red),
                    ),
                    color: Colors.red,
                  ),
                  height: 20,
                  width: itemWith * 12 + 1 + (index == 0 ? 1 : 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "ABCC",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                color: Colors.red,
                                fontSize: 12,
                                height: 1.4),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

}