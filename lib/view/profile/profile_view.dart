import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_d/view/profile/profile_view_model.dart';

import '../../utils/common_colors.dart';
import '../../utils/constant.dart';
import '../../widget/common_appbar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileViewModel mViewModel;


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel.attachedContext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: const CommonAppBar(
        title: "Profile",
        isTitleBold: true,
        isShowShadow: true,
      ),
      body: Center(
       child: GestureDetector(
          onTap: () {
            mViewModel.logOutApi();
          },
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: CommonColors.mRed.withOpacity(0.1),
                border: Border.all(color: CommonColors.mRed)),
            child: Text(
              'Logout',
              style: getAppStyle(
                  color: CommonColors.blackColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
