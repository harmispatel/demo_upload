import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/common_colors.dart';
import '../../../../utils/common_utils.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/local_images.dart';
import '../../../../widget/common_appbar.dart';
import '../../../../widget/primary_button.dart';
import '../order_details/order_details.dart';
import 'order_view_model.dart';

class OrdersView extends StatefulWidget {
  String title;
  final String filterStatus;

   OrdersView(
      {super.key, required this.title, required this.filterStatus});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  late OrderViewModel mViewModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel.attachedContext(context);
      _scrollController.addListener(_scrollListener);

      mViewModel.getOrderApi(filterStatus: widget.filterStatus);
    });
  }

  static Future<void> openGoogleMaps() async {
    const double destinationLatitude = 23.0225;
    const double destinationLongitude = 72.5714;
    final uri = Uri(
        scheme: "google.navigation",
        // host: '"0,0"',  {here we can put host}
        queryParameters: {'q': '$destinationLatitude, $destinationLongitude'});
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('An error occurred');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    mViewModel.resetPage();
    super.dispose();
  }

  void _scrollListener() {
    final mViewModel = context.read<OrderViewModel>();
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !mViewModel.isPageFinish) {
      mViewModel.getOrderApi(filterStatus: widget.filterStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<OrderViewModel>(context);
    return Scaffold(
      appBar: CommonAppBar(
        title: widget.title,
        iconTheme: IconThemeData(color: CommonColors.blackColor),
        isTitleBold: true,
        isShowShadow: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: mViewModel.orderList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 16),
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                color: CommonColors.primaryColor.withOpacity(0.4),
                width: 0.8,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              LocalImages.img_order_basket,
                              height: 40,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mViewModel.orderList[index].orderNumber ??
                                        '--',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: getAppStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    mViewModel.orderList[index].created ?? '--',
                                    style: getAppStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                push(OrderDetails(orderId: mViewModel.orderList[index].orderId ?? 0, orderNo: mViewModel.orderList[index].orderNumber ?? '',));
                              },
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 22,
                                color: CommonColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Divider(
                          color: CommonColors.mGrey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Payment Type",
                                style: getAppStyle(
                                  color: Colors.grey.withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                mViewModel.orderList[index].paymentMethod ??
                                    '--',
                                style: getAppStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Total",
                                style: getAppStyle(
                                  color: Colors.grey.withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "₹ ${mViewModel.orderList[index].total ?? '--'}",
                                style: getAppStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Status",
                                style: getAppStyle(
                                  color: Colors.grey.withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                mViewModel.orderList[index].status ?? '--',

                                style: getAppStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      kCommonSpaceV20,
                      kCommonSpaceV10,
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (widget.title == "Pending Orders") {

                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    width: kDeviceWidth,
                                    buttonsBorderRadius: const BorderRadius.all(
                                      Radius.circular(2),
                                    ),
                                    dismissOnTouchOutside: false,
                                    dismissOnBackKeyPress: false,
                                    headerAnimationLoop: false,
                                    animType: AnimType.topSlide,
                                    title: 'Confirm Your Ride',
                                    desc: 'Are you sure you want to start this ride?',
                                    buttonsTextStyle: getAppStyle(),
                                    descTextStyle: getAppStyle(fontSize: 15),
                                    titleTextStyle:
                                    getAppStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                    showCloseIcon: false,
                                    btnOk: PrimaryButton(
                                      label: "Confirm",
                                      buttonColor: CommonColors.primaryColor,
                                      labelColor: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      onPress: () async {
                                        Navigator.pop(context);

                                        await mViewModel.startOrderApi(orderId: mViewModel.orderList[index].orderId.toString());
                                       mViewModel.resetPage();
                                       await mViewModel.getOrderApi(filterStatus: "4");
                                       setState(() {
                                         widget.title = "On The Way";

                                       });
                                      },
                                    ),
                                    btnCancel: PrimaryButton(
                                      label: "Cancel",
                                      buttonColor: CommonColors.mRed,
                                      labelColor: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      onPress: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ).show();

                                  // openGoogleMaps();
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 70,
                                    child:
                                        Image.asset(LocalImages.img_delivered),
                                  ),
                                  Text(
                                    widget.title == "Delivered Orders"
                                        ? 'Delivered'
                                        : widget.title == "Pending Orders"
                                            ? 'Start Ride'
                                            : widget.title == "On The Way"
                                                ? 'On Way'
                                                : widget.title ==
                                                        'Cancelled Orders'
                                                    ? 'Cancelled'
                                                    : '--',
                                    style: GoogleFonts.eduNswActFoundation(
                                        color: CommonColors.primaryColor,
                                        fontSize: 21,
                                        height: 1.1,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          kCommonSpaceH15,
                          Expanded(
                            child: PrimaryButton(
                              height: 46,
                              label: "View Details",
                              buttonColor: CommonColors.primaryColor,
                              labelColor: CommonColors.mWhite,
                              onPress: () {
                                push(OrderDetails(orderId: mViewModel.orderList[index].orderId ?? 0, orderNo: mViewModel.orderList[index].orderNumber ?? '',));
                              },
                            ),
                          ),
                        ],
                      ),
                      kCommonSpaceV15,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
