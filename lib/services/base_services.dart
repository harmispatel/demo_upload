import 'package:s_d/models/login_master.dart';

abstract class BaseServices {
  Future<LoginMaster?> login({
    required Map<String, dynamic> params,
  });
}
