import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:s_d/models/dashboard_master.dart';

import '../../services/index.dart';
import '../../utils/common_utils.dart';

class HomeViewModel with ChangeNotifier {
  late BuildContext context;
  final _services = Services();
  String walletAmount = '';
  String pendingOrders = '';
  String deliveredOrders = '';
  String onTheWayOrders = '';
  String cancelledOrders = '';

  void attachedContext(BuildContext context) {
    this.context = context;
    notifyListeners();
  }

  Future<void> getDashBoardDataApi() async {
    CommonUtils.showProgressDialog();
    DashBoardMaster? master = await _services.api!.getDashBoardData();
    CommonUtils.hideProgressDialog();
    if (master == null) {
      CommonUtils.oopsMSG();
    } else if (!master.status!) {
      CommonUtils.showCustomToast(context, master.message);
    } else if (master.status!) {
      log("Success :: true");
      walletAmount = master.data?.walletAmount ?? '';
      pendingOrders = master.data?.pending ?? '';
      deliveredOrders = master.data?.delivered ?? '';
      onTheWayOrders = master.data?.onTheWay ?? '';
      cancelledOrders = master.data?.cancel ?? '';
    }
    notifyListeners();
  }
}
