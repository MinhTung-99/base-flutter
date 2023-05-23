import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// ViewInterface
mixin ViewInterface {
  /// buildBody
  Widget buildBody(BuildContext context);

  /// buildAppBar
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  /// buildBottomNavigationBar
  Widget? buildBottomNavigationBar(BuildContext context) {
    return null;
  }

  /// buildBottomSheet
  Widget? buildBottomSheet(BuildContext context) {
    return null;
  }

  /// buildDrawer
  Widget? buildDrawer(BuildContext context) {
    return null;
  }

  /// buildEndDrawer
  Widget? buildEndDrawer(BuildContext context) {
    return null;
  }

  /// buildFloatActionButton
  Widget? buildFloatActionButton(BuildContext context) {
    return null;
  }

  Color? backgroundColor;

  GlobalKey<ScaffoldState>? keyScaffold;

  /// buildPage
  Widget buildPage(BuildContext context) {
    return //KeyboardAutoDismiss(scaffold:
      Scaffold(
        key: keyScaffold,
      // resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        appBar: buildAppBar(context),
        body: buildBody(context),
        bottomNavigationBar: buildBottomNavigationBar(context),
        bottomSheet: buildBottomSheet(context),
        drawer: buildDrawer(context),
        endDrawer: buildEndDrawer(context),
        floatingActionButton: buildFloatActionButton(context),
    //)
    );
  }
}
