import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../database/app_preferences.dart';
import '../../models/login_master.dart';
import '../../services/api_para.dart';
import '../../services/index.dart';
import '../../utils/common_utils.dart';
import '../../utils/global_variables.dart';
import '../common_view/bottom_navbar/bottom_navbar_view.dart';

class LoginViewModel with ChangeNotifier{
  late BuildContext context;
  final _services = Services();

  void attachedContext(BuildContext context) {
    this.context = context;
    notifyListeners();
  }

  Future<void> loginApi({
    required String pinNumber,
  }) async {
    CommonUtils.showProgressDialog();
    Map<String, dynamic> params = <String, dynamic>{
      ApiParams.pin_number: pinNumber,
      ApiParams.device_token: deviceToken,
    };
    LoginMaster? master = await _services.api!.login(params: params);
    CommonUtils.hideProgressDialog();
    if (master == null) {
      CommonUtils.oopsMSG();
    } else if (!master.status!) {
      CommonUtils.showCustomToast(context, master.message);
    } else if (master.status!) {
      log("Success :: true");
      log("Access Token :: ${master.data?.token}");
      gUserId = master.data?.userId.toString() ?? '';
      AppPreferences.instance.setAccessToken(master.data?.token ?? '');
      AppPreferences.instance.setUserDetails(jsonEncode(master.data));
      globalUserMaster = AppPreferences.instance.getUserDetails();
      pushAndRemoveUntil(BottomNavBarView());

      CommonUtils.showCustomToast(context, master.message);
    }
    notifyListeners();
  }




}