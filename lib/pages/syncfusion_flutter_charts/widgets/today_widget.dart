import 'package:flutter/material.dart';

class ToDayWidget extends StatelessWidget {
  const ToDayWidget(
      {super.key, required this.itemWidth, required this.maxHeight});

  final double itemWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    var month = 4;
    return Positioned(
      left: itemWidth * (month - 1),
      top: 10,
      child: SizedBox(
        width: itemWidth * 2,
        height: maxHeight - 10,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(itemWidth)),
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.pink,
                      Colors.pinkAccent,
                    ],
                  ),
                ),
                width: itemWidth * 2,
                height: itemWidth * 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'today',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 12, color: Colors.white),
                    ),
                    Text(
                      'local date',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 4,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
