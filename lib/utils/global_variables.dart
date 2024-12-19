import 'package:flutter/material.dart';

import '../models/login_master.dart';

bool connectivity = true, isNotifyConnectivity = false;
String languageCode = "en";
GlobalKey<NavigatorState> mainNavKey = GlobalKey();
UserData? globalUserMaster;
String gUserId = "";
String? deviceToken = "";
String deviceType = "";