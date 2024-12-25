import 'package:animated_number/animated_number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_d/utils/common_utils.dart';

import '../../utils/common_colors.dart';
import '../../utils/constant.dart';
import '../../utils/local_images.dart';
import '../../widget/common_appbar.dart';
import 'home_view_model.dart';
import 'orders/order_view/orders_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  late HomeViewModel mViewModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel.attachedContext(context);
      WidgetsBinding.instance.addObserver(this);

      mViewModel.getDashBoardDataApi();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      mViewModel.getDashBoardDataApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: CommonAppBar(
        title: 'Home',
        iconTheme: IconThemeData(color: CommonColors.blackColor),
        isTitleBold: true,
        isShowShadow: true,
      ),
      body: SingleChildScrollView(
        padding: kCommonScreenPadding,
        child: Column(
          children: [
            Container(
              width: kDeviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CommonColors.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    height: 120,
                    LocalImages.img_wallet,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Amount",
                        style: getAppStyle(
                          fontSize: 20,
                          color: CommonColors.mWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      kCommonSpaceV5,
                      Row(
                        children: [
                          Text(
                            "₹",
                            style: getAppStyle(
                              fontSize: 18,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          AnimatedNumber(
                            startValue: 0,
                            endValue:
                                num.tryParse(mViewModel.walletAmount) ?? 0,
                            duration: Duration(seconds: 2),
                            isFloatingPoint: true,
                            style: getAppStyle(
                              fontSize: 18,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            kCommonSpaceV15,
            Image.asset(
              LocalImages.img_home_bg,
            ),
            kCommonSpaceV15,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      push(
                        OrdersView(
                          title: 'Pending Orders',
                          filterStatus: '5',
                        ),
                      ).then((_){
                        mViewModel.getDashBoardDataApi();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CommonColors.primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.update,
                                color: CommonColors.primaryColor,
                              ),
                            ),
                          ),
                          kCommonSpaceV15,
                          Text(
                            "Pending Orders",
                            style: getAppStyle(
                              fontSize: 20,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          kCommonSpaceV5,
                          Text(
                            mViewModel.pendingOrders,
                            style: getAppStyle(
                              fontSize: 16,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                kCommonSpaceH15,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      push(
                        OrdersView(
                          title: 'Delivered Orders',
                          filterStatus: '6',
                        ),
                      ).then((_){
                        mViewModel.getDashBoardDataApi();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CommonColors.primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.verified,
                                color: CommonColors.primaryColor,
                              ),
                            ),
                          ),
                          kCommonSpaceV15,
                          Text(
                            "Delivered Orders",
                            style: getAppStyle(
                              fontSize: 20,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          kCommonSpaceV5,
                          Text(
                            mViewModel.deliveredOrders,
                            style: getAppStyle(
                              fontSize: 16,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            kCommonSpaceV15,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      push(
                        OrdersView(
                          title: 'On The Way',
                          filterStatus: '4',
                        ),
                      ).then((_){
                        mViewModel.getDashBoardDataApi();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CommonColors.primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.directions_bike_sharp,
                                color: CommonColors.primaryColor,
                              ),
                            ),
                          ),
                          kCommonSpaceV15,
                          Text(
                            "On The Way",
                            style: getAppStyle(
                              fontSize: 20,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          kCommonSpaceV5,
                          Text(
                            mViewModel.onTheWayOrders,
                            style: getAppStyle(
                              fontSize: 16,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                kCommonSpaceH15,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      push(
                        OrdersView(
                          title: 'Cancelled Orders',
                          filterStatus: '7',
                        ),
                      ).then((_){
                        mViewModel.getDashBoardDataApi();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CommonColors.primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.cancel,
                                color: CommonColors.primaryColor,
                              ),
                            ),
                          ),
                          kCommonSpaceV15,
                          Text(
                            "Cancelled Orders",
                            style: getAppStyle(
                              fontSize: 20,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          kCommonSpaceV5,
                          Text(
                            mViewModel.cancelledOrders,
                            style: getAppStyle(
                              fontSize: 16,
                              color: CommonColors.mWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // kCommonSpaceV15,
            // kCommonSpaceV10,
            // SizedBox(
            //   height: 40,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: optionText.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       bool isSelected = selectedIndex == index;
            //       return Padding(
            //         padding: const EdgeInsets.only(right: 8),
            //         child: GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               selectedIndex = index;
            //             });
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //               color: isSelected
            //                   ? CommonColors.primaryColor
            //                   : CommonColors.mGrey200,
            //               borderRadius: BorderRadius.all(Radius.circular(8)),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.only(
            //                   left: 18, right: 18, top: 5, bottom: 5),
            //               child: Row(
            //                 children: [
            //                   Icon(
            //                     optionIcon[index],
            //                     color: isSelected
            //                         ? CommonColors.mWhite
            //                         : CommonColors.black54,
            //                   ),
            //                   Text(
            //                     " ${optionText[index]}",
            //                     style: getAppStyle(
            //                         color: isSelected
            //                             ? CommonColors.mWhite
            //                             : CommonColors.black54,
            //                         fontWeight: FontWeight.w500,
            //                         fontSize: 18),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // kCommonSpaceV20,
            // ListView.builder(
            //   shrinkWrap: true,
            //   scrollDirection: Axis.vertical,
            //   itemCount: 5,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       width: double.infinity,
            //       padding: const EdgeInsets.only(top: 14, bottom: 14),
            //       margin: const EdgeInsets.only(bottom: 14),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         color: Colors.white,
            //         border: Border.all(
            //           color: CommonColors.primaryColor.withOpacity(0.4),
            //           width: 0.8,
            //         ),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 14),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   "SLKT4442",
            //                   maxLines: 2,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: getAppStyle(
            //                     color: Colors.black,
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 18,
            //                   ),
            //                 ),
            //                 Text(
            //                   "₹992.00",
            //                   maxLines: 2,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: getAppStyle(
            //                     color: CommonColors.primaryColor,
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 18,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             const Padding(
            //               padding: EdgeInsets.symmetric(vertical: 4),
            //               child: Divider(
            //                 color: CommonColors.mGrey,
            //               ),
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Payment Method",
            //                   style: getAppStyle(
            //                     color: Colors.grey.withOpacity(0.6),
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 14,
            //                   ),
            //                 ),
            //                 Text(
            //                   'Case on Delivery',
            //                   style: getAppStyle(
            //                     color: Colors.black54,
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             kCommonSpaceV10,
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Delivery Time",
            //                   style: getAppStyle(
            //                     color: Colors.grey.withOpacity(0.6),
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 14,
            //                   ),
            //                 ),
            //                 const SizedBox(height: 2),
            //                 Text(
            //                   '10-12-24 04:00 PM',
            //                   style: getAppStyle(
            //                     color: Colors.black54,
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             kCommonSpaceV10,
            //             DropdownButtonFormField<String>(
            //               isExpanded: true,
            //               focusColor: Colors.white,
            //               value: _chosenValue,
            //               decoration: InputDecoration(
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: CommonColors.primaryColor
            //                           .withOpacity(0.4)),
            //                   borderRadius: BorderRadius.circular(8),
            //                 ),
            //                 disabledBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: CommonColors.primaryColor
            //                           .withOpacity(0.4)),
            //                   borderRadius: BorderRadius.circular(8),
            //                 ),
            //                 focusedBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: CommonColors.primaryColor
            //                           .withOpacity(0.4)),
            //                   borderRadius: BorderRadius.circular(8),
            //                 ),
            //                 border: OutlineInputBorder(
            //                   borderSide: BorderSide(
            //                       color: CommonColors.primaryColor
            //                           .withOpacity(0.4)),
            //                   borderRadius: BorderRadius.circular(8),
            //                 ),
            //                 filled: true,
            //                 fillColor: CommonColors.mWhite,
            //               ),
            //               icon: Padding(
            //                 padding: const EdgeInsets.only(right: 6),
            //                 child: Icon(
            //                   Icons.keyboard_arrow_down_outlined,
            //                   color: CommonColors.black54,
            //                 ),
            //               ),
            //               items: <String>[
            //                 'Delivered',
            //                 'Pending',
            //                 'Cancelled',
            //               ].map<DropdownMenuItem<String>>((String value) {
            //                 return DropdownMenuItem<String>(
            //                   value: value,
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(left: 10),
            //                     child: Text(
            //                       value,
            //                       style: TextStyle(color: Colors.black54),
            //                     ),
            //                   ),
            //                 );
            //               }).toList(),
            //               onChanged: (String? value) {
            //                 setState(() {
            //                   _chosenValue = value;
            //                 });
            //               },
            //             )
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
