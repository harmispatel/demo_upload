import 'dart:developer';

import 'package:s_d/models/order_details_master.dart';

import '../models/common_master.dart';
import '../models/dashboard_master.dart';
import '../models/get_order_master.dart';
import '../models/login_master.dart';
import 'api_url.dart';
import 'base_client.dart';
import 'base_services.dart';

class ApiServices extends BaseServices {
  AppBaseClient appBaseClient = AppBaseClient();

  // @override
  // Future<SignupMaster?> signUp({required Map<String, dynamic>? params}) async {
  //   dynamic response = await appBaseClient.postApiCall(
  //     url: ApiUrl.SIGN_UP,
  //     postParams: params,
  //   );
  //   if (response != null) {
  //     try {
  //       return SignupMaster.fromJson(response);
  //     } on Exception catch (e) {
  //       log("Exception :: $e");
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }
  //
  // @override
  // Future<CommonMaster?> verifyOTP(
  //     {required Map<String, dynamic> params}) async {
  //   dynamic response = await appBaseClient.postApiCall(
  //     url: ApiUrl.VERIFY_OTP,
  //     postParams: params,
  //   );
  //   if (response != null) {
  //     try {
  //       return CommonMaster.fromJson(response);
  //     } on Exception catch (e) {
  //       log("Exception :: $e");
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }
  //
  //
  // @override
  // Future<UserDetailsMaster?> getUserDetails() async {
  //   dynamic response = await appBaseClient.getApiCall(
  //     url: ApiUrl.USER_DETAIL,
  //   );
  //   if (response != null) {
  //     try {
  //       return UserDetailsMaster.fromJson(response);
  //     } on Exception catch (e) {
  //       log("Exception :: $e");
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }
  //
  // @override
  // Future<ProductListingMaster?> getSaleProduct(
  //     {required Map<String, dynamic> param}) async {
  //   dynamic response = await appBaseClient.postApiWithTokenCall(
  //     url: ApiUrl.SALE_PRODUCT,
  //     postParams: param,
  //   );
  //   if (response != null) {
  //     try {
  //       return ProductListingMaster.fromJson(response);
  //     } on Exception catch (e) {
  //       log("Exception :: $e");
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }
  //
  //
  // @override
  // Future<UploadMaster?> uploadPhotoOrVideo({
  //   required Map<String, String> param,
  //   required File file,
  //   void Function(int, int)? onProgress,
  // }) async {
  //   dynamic res = await appBaseClient.postVideoFormDataApiCall(
  //     url: ApiUrl.MODEL_PHOTO_OR_VIDEO_UPLOAD,
  //     postParams: param,
  //     file: file,
  //     fileKey: ApiParams.file,
  //     onProgress: onProgress,
  //   );
  //   if (res != null) {
  //     try {
  //       return UploadMaster.fromJson(res);
  //     } on Exception catch (e) {
  //       log("Exception :: $e");
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }
  //
  // @override
  // Future<DSignUpMaster?> updateDomainDetails({
  //   required Map<String, String> params,
  //   String? picture,
  //   String? fileKey,
  // }) async {
  //   dynamic response = await appBaseClient.postFormDataApiCall(
  //     url: DomainApiUrl.UPDATE,
  //     postParams: params,
  //     images: picture != null ? [File(picture)] : [],
  //     fileKey: fileKey,
  //   );
  //   if (response != null) {
  //     try {
  //       return DSignUpMaster.fromJson(response);
  //     } on Exception catch (e) {
  //       log("Exception :: $e");
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Future<LoginMaster?> login({
    required Map<String, dynamic> params,
  }) async {
    dynamic response = await appBaseClient.postFormDataApiCall(
      url: ApiUrl.LOGIN,
      postParams: params,
    );
    if (response != null) {
      try {
        return LoginMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<CommonMaster?> logOut() async {
    dynamic response = await appBaseClient.getApiCall(
      url: ApiUrl.LOG_OUT,
    );
    if (response != null) {
      try {
        return CommonMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<DashBoardMaster?> getDashBoardData() async {
    dynamic response = await appBaseClient.getApiCall(
      url: ApiUrl.DASHBOARD,
    );
    if (response != null) {
      try {
        return DashBoardMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }


  @override
  Future<GetOrderMaster?> getOrder({
    required Map<String, dynamic> params,
  }) async {
    dynamic response = await appBaseClient.postFormDataApiCall(
      url: ApiUrl.GET_ORDER,
      postParams: params,
    );
    if (response != null) {
      try {
        return GetOrderMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<OrderDetailsMaster?> getOrderDetails({
    required Map<String, dynamic> params,
  }) async {
    dynamic response = await appBaseClient.postFormDataApiCall(
      url: ApiUrl.ORDER_DETAILS,
      postParams: params,
    );
    if (response != null) {
      try {
        return OrderDetailsMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<CommonMaster?> startOrder({required Map<String, dynamic> params,}) async {
    dynamic response = await appBaseClient.postFormDataApiCall(
      url: ApiUrl.START_ORDER,
      postParams: params,

    );
    if (response != null) {
      try {
        return CommonMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<CommonMaster?> deliverOrder({required Map<String, dynamic> params,}) async {
    dynamic response = await appBaseClient.postFormDataApiCall(
      url: ApiUrl.DELIVER_ORDER,
      postParams: params,

    );
    if (response != null) {
      try {
        return CommonMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<CommonMaster?> cancelOrder({required Map<String, dynamic> params,}) async {
    dynamic response = await appBaseClient.postFormDataApiCall(
      url: ApiUrl.CANCEL_ORDER,
      postParams: params,

    );
    if (response != null) {
      try {
        return CommonMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<CommonMaster?> updateLocation({required Map<String, dynamic> params,}) async {
    dynamic response = await appBaseClient.postFormDataApiCall(
      url: ApiUrl.UPDATE_LOCATION,
      postParams: params,

    );
    if (response != null) {
      try {
        return CommonMaster.fromJson(response);
      } on Exception catch (e) {
        log("Exception :: $e");
        return null;
      }
    } else {
      return null;
    }
  }
}
