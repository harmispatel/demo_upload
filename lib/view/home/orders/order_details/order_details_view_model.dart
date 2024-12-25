import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../models/common_master.dart';
import '../../../../models/order_details_master.dart';
import '../../../../services/api_para.dart';
import '../../../../services/index.dart';
import '../../../../utils/common_utils.dart';
import '../../../../utils/global_variables.dart';
import '../../../common_view/bottom_navbar/bottom_navbar_view.dart';
import '../../../common_view/bottom_navbar/bottom_navbar_view_model.dart';

class OrderDetailsViewModel with ChangeNotifier{
  late BuildContext context;
  final _services = Services();
  String activeStatus = '';
  String paymentMethod = '';
  String orderNumber = '';
  String finalTotal = '';
  CustomerDetails? customerDetails;
  List<OrderItem>? orderItemList;

  void attachedContext(BuildContext context) {
    this.context = context;
    notifyListeners();
  }

  Future<void> getOrderDetailsApi({
    required String orderId,
  }) async {
    CommonUtils.showProgressDialog();
    Map<String, dynamic> params = <String, dynamic>{
      ApiParams.order_id: orderId,
    };
    OrderDetailsMaster? master = await _services.api!.getOrderDetails(params: params);
    CommonUtils.hideProgressDialog();
    if (master == null) {
      CommonUtils.oopsMSG();
    } else if (!master.status!) {
      CommonUtils.showCustomToast(context, master.message);
    } else if (master.status!) {
      log("Success :: true");
      activeStatus = master.data?.activeStatus ?? '';
      paymentMethod = master.data?.paymentMethod ?? '';
      orderNumber = master.data?.orderNumber ?? '';
      finalTotal = master.data?.finalTotal ?? '';
      customerDetails = master.data?.customerDetails;
      orderItemList = master.data?.orderItem ?? [];
    }
    notifyListeners();
  }


  Future<void> deliverOrderApi({
    required String orderId,
  }) async {
    CommonUtils.showProgressDialog();
    Map<String, dynamic> params = <String, dynamic>{
      ApiParams.order_id: orderId,
    };
    CommonMaster? master = await _services.api!.deliverOrder(params: params);
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

  Future<void> cancelOrderApi({
    required String orderId,
  }) async {
    CommonUtils.showProgressDialog();
    Map<String, dynamic> params = <String, dynamic>{
      ApiParams.order_id: orderId,
    };
    CommonMaster? master = await _services.api!.cancelOrder(params: params);
    CommonUtils.hideProgressDialog();
    if (master == null) {
      CommonUtils.oopsMSG();
    } else if (!master.status!) {
      CommonUtils.showCustomToast(context, master.message);
    } else if (master.status!) {
      log("Success :: true");
      mainNavKey.currentContext!
          .read<BottomNavbarViewModel>()
          .onMenuTapped(0);
      pushAndRemoveUntil(BottomNavBarView());
    }
    notifyListeners();
  }
}