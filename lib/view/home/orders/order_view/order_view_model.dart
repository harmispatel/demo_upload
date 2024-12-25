import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:s_d/models/common_master.dart';
import 'package:s_d/models/get_order_master.dart';

import '../../../../services/api_para.dart';
import '../../../../services/index.dart';
import '../../../../utils/common_utils.dart';

class OrderViewModel with ChangeNotifier {
  late BuildContext context;
  final _services = Services();
  bool isPageFinish = false;
  int currentPage = 1;
  bool isInitialLoading = true;
  List<OrderData> orderList = [];

  void attachedContext(BuildContext context) {
    this.context = context;
    notifyListeners();
  }

  Future<void> getOrderApi({
    required String filterStatus,
  }) async {
    CommonUtils.showProgressDialog();
    Map<String, dynamic> params = <String, dynamic>{
      ApiParams.filter_status: filterStatus,
      ApiParams.page: currentPage.toString(),
    };
    GetOrderMaster? master = await _services.api!.getOrder(params: params);
    CommonUtils.hideProgressDialog();
    if (master == null) {
      CommonUtils.oopsMSG();
    } else if (!master.status!) {
      CommonUtils.showCustomToast(context, master.message);
    } else if (master.status!) {
      log("Success :: true");
      if (currentPage == master.totalPage!) {
        isPageFinish = true;
      } else {
        currentPage++;
      }
      orderList.addAll(master.data ?? []);
    }
    notifyListeners();
  }

  Future<void> startOrderApi({
    required String orderId,
  }) async {
    CommonUtils.showProgressDialog();
    Map<String, dynamic> params = <String, dynamic>{
      ApiParams.order_id: orderId,
    };
    CommonMaster? master = await _services.api!.startOrder(params: params);
    CommonUtils.hideProgressDialog();
    if (master == null) {
      CommonUtils.oopsMSG();
    } else if (!master.status!) {
      CommonUtils.showCustomToast(context, master.message);
    } else if (master.status!) {
      log("Success :: true");
    }
    notifyListeners();
  }

  void resetPage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentPage = 1;
      isPageFinish = false;
      isInitialLoading = true;
      orderList.clear();
      notifyListeners();
    });
  }
}
