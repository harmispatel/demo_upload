import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../database/app_preferences.dart';
import '../../models/common_master.dart';
import '../../services/index.dart';
import '../../utils/common_utils.dart';
import '../../utils/global_variables.dart';
import '../common_view/bottom_navbar/bottom_navbar_view_model.dart';
import '../login/login_view.dart';

class ProfileViewModel with ChangeNotifier{
  late BuildContext context;
  final _services = Services();

  void attachedContext(BuildContext context) {
    this.context = context;
    notifyListeners();
  }

  Future<void> logOutApi() async {
    CommonUtils.showProgressDialog();
    CommonMaster? master = await _services.api!.logOut();
    CommonUtils.hideProgressDialog();
    if (master == null) {
      CommonUtils.oopsMSG();
    } else if (!master.status!) {
      CommonUtils.showCustomToast(context, master.message);
    } else if (master.status!) {
      log("Success :: true");
      await AppPreferences.instance.clear();
      gUserId = '';
      globalUserMaster = null;

      mainNavKey.currentContext!.read<BottomNavbarViewModel>().selectedIndex =
      0;

      pushAndRemoveUntil(const LoginView());
    }
    notifyListeners();
  }


}