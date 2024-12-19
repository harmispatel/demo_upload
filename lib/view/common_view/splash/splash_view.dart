import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_d/view/common_view/splash/splash_view_model.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/common_utils.dart';
import '../../../utils/constant.dart';
import '../../../utils/local_images.dart';
import '../../login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel mViewModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel.attachedContext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<SplashViewModel>(context);
    return Scaffold(
      backgroundColor: CommonColors.mWhite,
      body: Center(
        child: Image.asset(
          height: kDeviceHeight,
          width: kDeviceWidth,
          LocalImages.img_splash_logo,
        ),
      ),
    );
  }
}
