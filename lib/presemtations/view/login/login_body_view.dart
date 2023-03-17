

import 'package:flutter/cupertino.dart';

import '../../base/ui/view/state_less_view_base.dart';
import '../register/register_view.dart';
import 'login_view_model.dart';
import 'package:get/get.dart';

class LoginBody extends StateLessViewBase<LoginviewModel> {
  LoginBody({super.key});


  @override
  // TODO: implement viewModel
  LoginviewModel get viewModel => Get.put(LoginviewModel());

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        child: const Align(
          alignment: Alignment.center,
          child: Text('MOVE_REGISTER'),
        ),
        onTap: () {
          Get.toNamed(RegisterView.router);
        },
      ),
    );
  }

}