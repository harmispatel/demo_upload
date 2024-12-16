import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/constant.dart';
import '../../../widget/primary_button.dart';
import '../../home/home_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});
  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    Center(
        child: Text(
      "Profile",
      style: getAppStyle(fontSize: 22),
    )),
  ];

  void onMenuTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {}
        return await AwesomeDialog(
          bodyHeaderDistance: 20,
          context: context,
          dialogType: DialogType.info,
          width: MediaQuery.of(context).size.width * 0.90,
          buttonsBorderRadius: const BorderRadius.all(
            Radius.circular(2),
          ),
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          headerAnimationLoop: false,
          animType: AnimType.topSlide,
          descTextStyle: getAppStyle(fontSize: 15),
          titleTextStyle:
              getAppStyle(fontSize: 18, fontWeight: FontWeight.w500),
          title: 'Close App',
          desc: 'Are you sure you want to close the app?',
          btnOk: PrimaryButton(
            label: "Yes",
            buttonColor: CommonColors.primaryColor,
            labelColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            onPress: () {
              Navigator.of(context).pop(true);
              SystemNavigator.pop();
            },
          ),
          btnCancel: PrimaryButton(
            label: "No",
            buttonColor: CommonColors.mRed,
            labelColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            onPress: () {
              Navigator.of(context).pop(false);
            },
          ),
        ).show();
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: CommonColors.mWhite,
            highlightColor: CommonColors.mWhite,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            backgroundColor: CommonColors.mWhite,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: CommonColors.primaryColor,
            unselectedItemColor: CommonColors.black54,
            showUnselectedLabels: true,
            onTap: onMenuTapped,
          ),
        ),
      ),
    );
  }
}
