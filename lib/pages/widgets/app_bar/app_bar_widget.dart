
import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget(
      {required BuildContext context,
        super.key,
        String? title,
        bool showBackButton = false,
        Function()? onTap,
        String? childImage,
        Widget?
        actions, //should change to List<Widget>? if there is more than one widget.
        Widget? leading})
      : super(
    centerTitle: true,
    title: Text(title ?? '', textAlign: TextAlign.center, maxLines: 1),
    shadowColor: Colors.transparent,
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2.0),
        child: Container(
          color: Colors.blue,
          height: 2.0,
        )),
    // flexibleSpace: FlexibleSpaceBar(
    //   centerTitle: true,
    //   background: Image.asset(
    //     'assets/images/png/ic_background_appbar.png',
    //     fit: BoxFit.cover,
    //     color: ThemeHelpers.shared.colorSchema(context).appbarColor,
    //     colorBlendMode: BlendMode.multiply,
    //   ),
    // ),
    automaticallyImplyLeading: false,
    // leadingWidth: 40,
    // leading: showBackButton
    //     ? TextButton(
    //     onPressed: () {
    //       onTap?.call() ?? NavigatorHelpers.shared.pop();
    //     },
    //     child: SvgPicture.asset(
    //       'assets/images/ic_back.svg',
    //     ))
    //     : leading,
    // ẩn nút BACK
    actions: actions == null ? [] : [actions],
    // toolbarHeight: 41.5, // remove this line, using auto
  );
}