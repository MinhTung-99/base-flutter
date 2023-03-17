
import 'package:flutter/cupertino.dart';

import '../../../environment.dart';
import '../../base/components/app_bar.dart';
import '../../base/ui/view/state_full_view_base.dart';
import 'login_body_view.dart';
import 'login_view_model.dart';
import 'package:get/get.dart';

class LoginView extends StatefulViewBase {

  static const router = "/LoginView";

  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => LoginViewState();

}

class LoginViewState extends ViewState<LoginView, LoginviewModel>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*var config = Configuration.local([Account.schema]);
    var realm = Realm(config);

    *//*var account = Account('abc', '12345');
    realm.write(() {
      realm.add(account);
    });*//*

    var accounts = realm.all<Account>();
    var acc = accounts[0];
    print("My acc is ${acc.userName} and ${acc.password}");*/

  }

  @override
  // TODO: implement viewModel
  LoginviewModel get viewModel => Get.put(LoginviewModel());

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return LoginBody();
  }

  @override

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return AppBarSimpleWidget(context: context, title: AppEnviroment.title,);
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    // TODO: implement buildBottomNavigationBar
    return const Text('BottomNav');
  }
}
