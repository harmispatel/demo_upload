import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:s_d/view/login/login_view.dart';
import '../../../database/app_preferences.dart';
import '../../../services/index.dart';
import '../../../utils/common_utils.dart';
import '../../../utils/global_variables.dart';
import '../bottom_navbar/bottom_navbar_view.dart';

class SplashViewModel with ChangeNotifier {
  late BuildContext context;
  final services = Services();

  Future<void> attachedContext(BuildContext context) async {
    this.context = context;
    startTimer();
    getDeviceDetails();
  }


  startTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      String accessToken = AppPreferences.instance.getAccessToken();
      globalUserMaster = AppPreferences.instance.getUserDetails();

      log("Stored User Details :: ${jsonEncode(AppPreferences.instance.getUserDetails())}");
      log('access token :: $accessToken');

      if (accessToken.isEmpty) {
        pushAndRemoveUntil(const LoginView());
      } else if (accessToken.isNotEmpty ) {
        pushAndRemoveUntil(const BottomNavBarView());
      }
    });
  }

  Future<void> getDeviceDetails() async {
    try {
      deviceToken = await FirebaseMessaging.instance.getToken();
      if (Platform.isAndroid) {
        deviceType = 'android';
      } else if (Platform.isIOS) {
        deviceType = 'iOS';
      } else {
        deviceType = 'Unknown';
        deviceToken = 'Unknown';
      }
      print("..............Device Type :: $deviceType");
      print("..............Device Token ::  $deviceToken");
    } catch (e) {
      print("Error getting FCM token: $e");
    }
  }

}
