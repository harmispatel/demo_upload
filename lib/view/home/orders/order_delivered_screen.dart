import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_d/utils/constant.dart';
import 'package:s_d/utils/local_images.dart';

import '../../../utils/common_utils.dart';
import '../../../utils/global_variables.dart';
import '../../common_view/bottom_navbar/bottom_navbar_view.dart';
import '../../common_view/bottom_navbar/bottom_navbar_view_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 250, LocalImages.img_order_basket),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Text(
                      'Order Successfully Delivered!',
                      style: getAppStyle(
                          fontSize: 30,
                          color: Color(0xff7ac142),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                kCommonSpaceV5,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Great job! Your delivery was completed successfully. The customer has received their order. Thank you for your timely service. Keep it up!",
                    style: getAppStyle(
                        fontSize: 16, height: 1.2, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: SizedBox(
            width: 65,
            height: 65,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                mainNavKey.currentContext!
                    .read<BottomNavbarViewModel>()
                    .onMenuTapped(0);
                pushAndRemoveUntil(BottomNavBarView());
              },
              foregroundColor: Color(0xff7ac142).withOpacity(0.1),
              backgroundColor: Color(0xff7ac142),
              child: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
