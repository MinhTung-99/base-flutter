
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'responsive.dart';

class AppBarSimpleWidget extends AppBar {
  AppBarSimpleWidget({
    required BuildContext context,
    Key? key,
    String title = 'title',
    double elevation = 0,
    List<Widget> rightActions = const [],
  }) : super(
    key: key,
    centerTitle: true,
    title: Text(
      title,
      overflow: TextOverflow.ellipsis,
    ),
    elevation: elevation,
    leadingWidth: 80,
    backgroundColor: Colors.red,
    actions: rightActions,
  );
}

class AppBarIconBackWidget extends AppBar {
  AppBarIconBackWidget({
    required BuildContext context,
    Key? key,
    String title = 'title',
    double elevation = 0,
    List<Widget> rightActions = const [],
  }) : super(
    key: key,
    centerTitle: true,
    title: Text(
      title,
      overflow: TextOverflow.ellipsis,
    ),
    elevation: elevation,
    leadingWidth: 80,
    backgroundColor: Colors.red,
    leading: GestureDetector(
      onTap: Get.back,
      child: Row(
        children: const [
          IconArrowBack(),
          SizedBox(
            width: 6,
          ),
          Padding(padding: EdgeInsets.only(top: 14), child: Text(
              '戻る', style: TextStyle(fontSize: 16),
          ),)
        ],
      ),
    ),
    actions: rightActions,
  );
}

class IconArrowBack extends StatelessWidget {
  const IconArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Responsive(
      mobile: SizedBox(
        width: 16,
        height: 25,
        child: BackButton(),
      ),
      tablet: SizedBox(
        width: 16,
        height: 25,
        child: BackButton(),
      ),
    );
  }
}