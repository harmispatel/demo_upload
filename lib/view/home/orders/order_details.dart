import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/local_images.dart';
import '../../../widget/common_appbar.dart';
import '../../../widget/primary_button.dart';
import 'order_delivered_screen.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool isFinished = false;

  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: "Order Details",
          isShowShadow: true,
          isTitleBold: true,
          iconTheme: IconThemeData(color: CommonColors.blackColor),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CommonColors.mRed.withOpacity(0.1),
                    border: Border.all(color: CommonColors.mRed)),
                child: Text(
                  'Cancel Order',
                  style: getAppStyle(
                      color: CommonColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: kDeviceWidth,
                color: CommonColors.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white30, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.access_time,
                            color: CommonColors.mWhite,
                          ),
                        ),
                      ),
                      kCommonSpaceH15,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimated Delivery Time',
                            style: getAppStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: CommonColors.mWhite),
                          ),
                          Text(
                            '15-20 Minutes',
                            style: getAppStyle(
                                fontSize: 16, color: CommonColors.mWhite),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: CommonColors.primaryColor.withOpacity(0.3 / 2),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.card_travel,
                          color: CommonColors.primaryColor,
                        ),
                      ),
                    ),
                    kCommonSpaceH15,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ID",
                          style: getAppStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: CommonColors.blackColor),
                        ),
                        Text(
                          'SLKT-1234',
                          style: getAppStyle(
                              fontSize: 14, color: CommonColors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Divider(
                  color: CommonColors.mGrey500,
                  thickness: 1,
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shop Address - 1",
                        style: getAppStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: CommonColors.blackColor),
                      ),
                      kCommonSpaceV5,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop name : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              'Patel pasti bhandar',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop address : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              'Shop No.302, patel road, near garden, Gondal, Gujarat',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop contact : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              '99999 88888',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      kCommonSpaceV10,
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              label: "Call",
                              buttonColor: CommonColors.greenColor,
                              labelColor: Colors.white,
                              shadowColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              onPress: () {
                                _dialNumber("8866181825");
                              },
                            ),
                          ),
                          kCommonSpaceH15,
                          Expanded(
                            child: PrimaryButton(
                              label: "Location",
                              buttonColor: Colors.blue,
                              labelColor: Colors.white,
                              shadowColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              onPress: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shop Address - 2",
                        style: getAppStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: CommonColors.blackColor),
                      ),
                      kCommonSpaceV5,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop name : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              'Khodal pan',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop address : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              'Shop No.02, near swami mandir, Gondal',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop contact : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              '99999 88888',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      kCommonSpaceV10,
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              label: "Call",
                              buttonColor: CommonColors.greenColor,
                              labelColor: Colors.white,
                              shadowColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              onPress: () {
                                _dialNumber("8866181825");
                              },
                            ),
                          ),
                          kCommonSpaceH15,
                          Expanded(
                            child: PrimaryButton(
                              label: "Location",
                              buttonColor: Colors.blue,
                              labelColor: Colors.white,
                              shadowColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              onPress: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Divider(
                  color: CommonColors.mGrey500,
                  thickness: 1,
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "5 items in this order :",
                  style: getAppStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Shop - 1 Items :",
                  style: getAppStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CommonColors.blackColor),
                ),
              ),
              kCommonSpaceV10,
              ListView.builder(
                padding: const EdgeInsets.only(top: 0, right: 15),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  bool isLastItem = index == 3 - 1;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 0),
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.quickpantry.in/cdn/shop/products/maggi-masala-instant-noodles-35-g-quick-pantry_500x500.jpg?v=1710539050'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            kCommonSpaceH10,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Maggi Masala Instant Noodles 35 g',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: getAppStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: CommonColors.blackColor,
                                    ),
                                  ),
                                  Text(
                                    "x1",
                                    style: getAppStyle(
                                      fontSize: 14,
                                      color: CommonColors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            kCommonSpaceH10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₹12",
                                  style: getAppStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: CommonColors.blackColor,
                                  ),
                                ),
                                Text(
                                  "₹14",
                                  style: getAppStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14,
                                    color: CommonColors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Add divider only if it's not the last item
                      if (!isLastItem)
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Divider(
                            color: CommonColors.mGrey500,
                            thickness: 1,
                          ),
                        ),
                    ],
                  );
                },
              ),
              kCommonSpaceV15,
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Shop - 2 Items :",
                  style: getAppStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CommonColors.blackColor),
                ),
              ),
              kCommonSpaceV15,
              ListView.builder(
                padding: const EdgeInsets.only(top: 0, right: 15),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  bool isLastItem = index == 2 - 1;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 0),
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.quickpantry.in/cdn/shop/products/maggi-masala-instant-noodles-35-g-quick-pantry_500x500.jpg?v=1710539050'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            kCommonSpaceH10,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Maggi Masala Instant Noodles 35 g',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: getAppStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: CommonColors.blackColor,
                                    ),
                                  ),
                                  Text(
                                    "x1",
                                    style: getAppStyle(
                                      fontSize: 14,
                                      color: CommonColors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            kCommonSpaceH10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₹12",
                                  style: getAppStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: CommonColors.blackColor,
                                  ),
                                ),
                                Text(
                                  "₹14",
                                  style: getAppStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14,
                                    color: CommonColors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Add divider only if it's not the last item
                      if (!isLastItem)
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Divider(
                            color: CommonColors.mGrey500,
                            thickness: 1,
                          ),
                        ),
                    ],
                  );
                },
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Divider(
                  color: CommonColors.mGrey300,
                  thickness: 4,
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer information :",
                        style: getAppStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: CommonColors.blackColor),
                      ),
                      kCommonSpaceV5,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Customer name : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              'Rajnish bhai',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Customer address : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              'A-101, Kum Kum apprtment, near baps swaminarayan mandir, haveli gali, gondal',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Customer contact : ',
                            style: getAppStyle(
                                fontSize: 14, color: CommonColors.blackColor),
                          ),
                          Expanded(
                            child: Text(
                              '99999 88888',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ),
                        ],
                      ),
                      kCommonSpaceV10,
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              label: "Call",
                              buttonColor: CommonColors.greenColor,
                              labelColor: Colors.white,
                              shadowColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              onPress: () {
                                _dialNumber("8866181825");
                              },
                            ),
                          ),
                          kCommonSpaceH15,
                          Expanded(
                            child: PrimaryButton(
                              label: "Location",
                              buttonColor: Colors.blue,
                              labelColor: Colors.white,
                              shadowColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              onPress: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Divider(
                  color: CommonColors.mGrey300,
                  thickness: 4,
                ),
              ),
              kCommonSpaceV10,
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bill Details",
                        style: getAppStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Item Total",
                            style: getAppStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "₹42",
                            style: getAppStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      kCommonSpaceV3,
                      Row(
                        children: [
                          Text(
                            "Delivery Charge",
                            style: getAppStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          // Text(
                          //   "₹${"9"}",
                          //   style: getAppStyle(
                          //     color: Colors.grey,
                          //     decoration: TextDecoration.lineThrough,
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 13,
                          //   ),
                          // ),
                          kCommonSpaceH10,
                          Text(
                            "+ ₹20",
                            style: getAppStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              textDecorationColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      kCommonSpaceV3,
                      Row(
                        children: [
                          Text(
                            "Coupon Discount",
                            style: getAppStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "- ₹8",
                            style: getAppStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      kCommonSpaceV3,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Paid",
                            style: getAppStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹54",
                            style: getAppStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      kCommonSpaceV10,
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.green.withOpacity(0.3),
                          image: DecorationImage(
                              image:
                                  AssetImage(LocalImages.img_total_saving_bg),
                              fit: BoxFit.fill),
                        ),
                        child: Center(
                          child: RichText(
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.end,
                            textDirection: TextDirection.rtl,
                            softWrap: true,
                            maxLines: 1,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Saving ',
                                  style: getAppStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.green,
                                  ),
                                ),
                                TextSpan(
                                  text: "₹8",
                                  style: getAppStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.green,
                                  ),
                                ),
                                TextSpan(
                                  text: " on this order.",
                                  style: getAppStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.green,
                                  ),
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.star_rate_outlined,
                                    size: 17,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              kCommonSpaceV20,
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
          child: SwipeableButtonView(
            buttonText: 'SLIDE TO DELIVERY',
            buttonWidget: Container(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              ),
            ),
            activeColor: Color(0xFF009C41),
            isFinished: isFinished,
            onWaitingProcess: () {
              // Set a delay to simulate waiting process
              Future.delayed(Duration(seconds: 1), () {
                setState(() {
                  isFinished = true; // Mark the process as finished
                });
              });
            },
            onFinish: () async {
              if (isFinished) {
                await Future.delayed(Duration(milliseconds: 100));

                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: DashboardScreen(),
                  ),
                );

                setState(() {
                  isFinished = false;
                });
              }
            },
          ),
        ));
  }
}
