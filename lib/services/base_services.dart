import 'package:s_d/models/login_master.dart';

import '../models/common_master.dart';
import '../models/dashboard_master.dart';
import '../models/get_order_master.dart';
import '../models/order_details_master.dart';

abstract class BaseServices {
  Future<LoginMaster?> login({
    required Map<String, dynamic> params,
  });

  Future<CommonMaster?> logOut();

  Future<DashBoardMaster?> getDashBoardData();

  Future<GetOrderMaster?> getOrder({
    required Map<String, dynamic> params,
  });

  Future<OrderDetailsMaster?> getOrderDetails({
    required Map<String, dynamic> params,
  });

  Future<CommonMaster?> startOrder({required Map<String, dynamic> params,});

  Future<CommonMaster?> deliverOrder({required Map<String, dynamic> params,});

  Future<CommonMaster?> cancelOrder({required Map<String, dynamic> params,});

  Future<CommonMaster?> updateLocation({required Map<String, dynamic> params,});
}
