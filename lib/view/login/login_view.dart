import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:s_d/view/common_view/bottom_navbar/bottom_navbar_view.dart';

import '../../utils/common_colors.dart';
import '../../utils/common_utils.dart';
import '../../utils/constant.dart';
import '../../utils/local_images.dart';
import '../../widget/common_appbar.dart';
import '../../widget/primary_button.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel mViewModel;

  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel.attachedContext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: const CommonAppBar(
        title: "SOLIKET",
        isTitleBold: true,
        isShowShadow: true,
      ),
      body: Padding(
        padding: kCommonScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Enter Your Pin",
              style: getAppStyle(fontWeight: FontWeight.w500, fontSize: 19),
            ),
            kCommonSpaceV20,
            otpPinWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Delivery Hero!",
                        style: getAppStyle(
                            fontSize: 22,
                            height: 1.2,
                            fontWeight: FontWeight.w500),
                      ),
                      kCommonSpaceV10,
                      DefaultTextStyle(
                        style: getAppStyle(fontSize: 18.0, color: Colors.black),
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                'Remember, timely deliveries make happy customers. Let’s get started and make today a success...',
                                speed: Duration(milliseconds: 100)),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(height: 180, LocalImages.img_delivery_boy),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: PrimaryButton(
          height: 50,
          label: "Verify and Proceed",
          lblSize: 18,
          onPress: () {
            if (otpController.text.length == 6) {
              mViewModel.loginApi(pinNumber: otpController.text.trim());
            } else {
              CommonUtils.showCustomToast(context, "Please enter Six digits");
            }
          },
        ),
      ),
    );
  }

  Widget otpPinWidget() {
    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.width * 0.12,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: CommonColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      // border: Border.all(color: CommonColors.primaryColor.withOpacity(0.4)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: CommonColors.mTransparent,
      ),
    );

    return Pinput(
      controller: otpController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      length: 6,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
      // onCompleted: (pin) async {
      //   if (otpController.text == "123456") {
      //     pushAndRemoveUntil(HomeView());
      //   }
      // },
    );
  }
}

class RegEx {
  static final validPasswordRegex = RegExp("^.{8,}\$");
  static final validEmailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final validNameRegex = RegExp(r"^[a-zA-Z ]{3,50}$");
  static final validNomineeNameRegex = RegExp(r"^[a-zA-Z][a-zA-Z `']{1,32}$");
  static final validPANNameRegex = RegExp(r"^[a-zA-Z][a-zA-Z. `']{1,64}$");
  static final validPhoneNumberRegex = RegExp(r"^[0-9+]{10,13}$");
  static final startsWithCountryCodeRegex = RegExp(r"\+[0-9]{2}[0-9]+$");
  static final validPincodeRegex = RegExp(r"^[0-9]{6}$");
  static final validDateRegex =
      RegExp(r"^(([123]0|[012][1-9]|31)-(0[1-9]|1[012])-[0-9]{4})$");
  static final validPANRegex = RegExp(r"^[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}$");
  static final validBankAccountNumber = RegExp(r"^[,0-9]{9,20}$");
  static final goalNameRegex = RegExp(r'^[\x00-\x7F]+$');
  static final validAccountHolderNameRegex = RegExp(r'^.{4,120}$');
  static final otpLengthRegex = RegExp(r'(\d{6})');
}
