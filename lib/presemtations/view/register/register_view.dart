
import 'package:base/presemtations/view/register/register_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../base/components/app_bar.dart';
import '../../base/ui/view/state_less_view_base.dart';

class RegisterView extends StateLessViewBase<RegisterViewModel>{
  static const router = "/RegisterView";

  RegisterView({super.key});

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return const Align(
      alignment: Alignment.center,
      child: Text('REGISTER'),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return AppBarIconBackWidget(context: context);
  }
}