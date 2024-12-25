import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/common_colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/local_images.dart';
import '../../../../widget/common_appbar.dart';
import '../../../../widget/primary_button.dart';
import '../order_delivered_screen.dart';
import 'order_details_view_model.dart';

class OrderDetails extends StatefulWidget {
  final int orderId;
  final String orderNo;

  const OrderDetails({super.key, required this.orderId, required this.orderNo});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool isFinished = false;

  late OrderDetailsViewModel mViewModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel.attachedContext(context);
      mViewModel.getOrderDetailsApi(orderId: widget.orderId.toString());
    });
  }

  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<OrderDetailsViewModel>(context);
    return Scaffold(
        appBar: CommonAppBar(
          title: widget.orderNo,
          isShowShadow: true,
          isTitleBold: true,
          iconTheme: IconThemeData(color: CommonColors.blackColor),
          actions: [
            if (mViewModel.activeStatus == '4')
              GestureDetector(
                onTap: () {
                  mViewModel.cancelOrderApi(orderId: widget.orderId.toString());
                },
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white30, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            color: CommonColors.mWhite,
                          ),
                        ),
                      ),
                      kCommonSpaceH10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment type',
                            style: getAppStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: CommonColors.mWhite),
                          ),
                          Text(
                            mViewModel.paymentMethod,
                            style: getAppStyle(
                                fontSize: 16, color: CommonColors.mWhite),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: getAppStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: CommonColors.mWhite),
                          ),
                          Text(
                            '₹${mViewModel.finalTotal}',
                            style: getAppStyle(
                                fontSize: 16, color: CommonColors.mWhite),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              kCommonSpaceV15,
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Customer information :",
                          style: getAppStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: CommonColors.blackColor),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            _dialNumber(
                                mViewModel.customerDetails?.mobile.toString() ??
                                    '');
                          },
                          child: Image.network(
                              height: 30,
                              "https://media.istockphoto.com/id/971654072/vector/red-call-icon.jpg?s=612x612&w=0&k=20&c=bwlNm0pnNs98evZv4x8N3Cq3XQAWIKLEzJPmQpbMgWY="),
                        ),
                        kCommonSpaceH10,
                        Image.network(
                            height: 30,
                            "https://w7.pngwing.com/pngs/158/65/png-transparent-location-application-icon-computer-software-business-information-organization-location-logo-miscellaneous-blue-company-thumbnail.png"),
                      ],
                    ),
                    kCommonSpaceV5,
                    Table(
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        // Adjust the width based on content
                        1: FlexColumnWidth(),
                        // Take the remaining space
                      },
                      children: [
                        TableRow(
                          children: [
                            Text(
                              'Name :',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.blackColor),
                            ),
                            Text(
                              mViewModel.customerDetails?.name ?? '',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          children: [
                            kCommonSpaceV5,
                            kCommonSpaceV5,
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Address : ',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.blackColor),
                            ),
                            Text(
                              mViewModel.customerDetails?.address ?? '',
                              style: getAppStyle(
                                  fontSize: 14,
                                  color: CommonColors.black54,
                                  height: 1),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          children: [
                            kCommonSpaceV5,
                            kCommonSpaceV5,
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Contact :',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.blackColor),
                            ),
                            Text(
                              mViewModel.customerDetails?.mobile ?? '',
                              style: getAppStyle(
                                  fontSize: 14, color: CommonColors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
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
              ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: mViewModel.orderItemList?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int sellerIndex) {
                  final seller = mViewModel.orderItemList![sellerIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// --- Store Information Section ---
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Store information:",
                                  style: getAppStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: CommonColors.blackColor),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    _dialNumber(seller.mobileNumber ?? '--');
                                  },
                                  child: Image.network(
                                    height: 30,
                                    "https://media.istockphoto.com/id/971654072/vector/red-call-icon.jpg?s=612x612&w=0&k=20&c=bwlNm0pnNs98evZv4x8N3Cq3XQAWIKLEzJPmQpbMgWY=",
                                  ),
                                ),
                                kCommonSpaceH10,
                                Image.network(
                                  height: 30,
                                  "https://w7.pngwing.com/pngs/158/65/png-transparent-location-application-icon-computer-software-business-information-organization-location-logo-miscellaneous-blue-company-thumbnail.png",
                                ),
                              ],
                            ),
                            kCommonSpaceV5,
                            Table(
                              columnWidths: const {
                                0: IntrinsicColumnWidth(),
                                1: FlexColumnWidth(),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    Text(
                                      'Name:',
                                      style: getAppStyle(
                                          fontSize: 14,
                                          color: CommonColors.blackColor),
                                    ),
                                    Text(
                                      seller.storeName ?? '--',
                                      style: getAppStyle(
                                          fontSize: 14,
                                          color: CommonColors.black54),
                                    ),
                                  ],
                                ),
                                TableRow(
                                    children: [kCommonSpaceV5, kCommonSpaceV5]),
                                TableRow(
                                  children: [
                                    Text(
                                      'Address:',
                                      style: getAppStyle(
                                          fontSize: 14,
                                          color: CommonColors.blackColor),
                                    ),
                                    Text(
                                      seller.address ?? "No Address Provided",
                                      style: getAppStyle(
                                          fontSize: 14,
                                          color: CommonColors.black54,
                                          height: 1),
                                    ),
                                  ],
                                ),
                                TableRow(
                                    children: [kCommonSpaceV5, kCommonSpaceV5]),
                                TableRow(
                                  children: [
                                    Text(
                                      'Contact:',
                                      style: getAppStyle(
                                          fontSize: 14,
                                          color: CommonColors.blackColor),
                                    ),
                                    Text(
                                      seller.mobileNumber ?? '--',
                                      style: getAppStyle(
                                          fontSize: 14,
                                          color: CommonColors.black54),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
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

                      /// --- Product List Section ---
                      ListView.builder(
                        padding: const EdgeInsets.only(top: 0, right: 15),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: seller.item?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int productIndex) {
                          final product = seller.item![productIndex];
                          bool isLastItem =
                              productIndex == (seller.item?.length ?? 1) - 1;

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
                                              product.image ?? '--'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    kCommonSpaceH10,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.productName ?? '--',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: getAppStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: CommonColors.blackColor,
                                            ),
                                          ),
                                          Text(
                                            "x${product.qty}",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "₹${product.discountedPrice}",
                                          style: getAppStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: CommonColors.blackColor,
                                          ),
                                        ),
                                        Text(
                                          "₹${product.price}",
                                          style: getAppStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 14,
                                            color: CommonColors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              if (!isLastItem)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
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
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Divider(
                          color: CommonColors.mGrey300,
                          thickness: 4,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: mViewModel.activeStatus == '4'  ? Padding(
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

              Future.delayed(Duration(seconds: 1), () {
                setState(() {
                  isFinished = true;
                });
              });
            },
            onFinish: () async {
              if (isFinished) {
                await mViewModel.deliverOrderApi(orderId: widget.orderId.toString());
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
        ) : null);
  }
}
