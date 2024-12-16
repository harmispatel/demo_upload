import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/common_colors.dart';
import '../../../utils/common_utils.dart';
import '../../../utils/constant.dart';
import '../../../utils/local_images.dart';
import '../../../widget/common_appbar.dart';
import '../../../widget/primary_button.dart';
import 'order_details.dart';

class OrdersView extends StatefulWidget {
  final String title;

  const OrdersView({super.key, required this.title});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  final double fromLat = 22.3039;
  final double fromLng = 70.8022;
  final double toLat = 23.0225;
  final double toLng = 72.5714;

  // void openGoogleMaps() async {
  //   final String googleMapsUrl =
  //       'https://www.google.com/maps/dir/?api=1&origin=$fromLat,$fromLng&destination=$toLat,$toLng';
  //
  //   if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
  //     await launchUrl(Uri.parse(googleMapsUrl),
  //         mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }

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
  Widget build(BuildContext context) {
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
        itemCount: 8,
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
                                    'SLKT-1234',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: getAppStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '14 Dec 2024 10:19 PM',
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
                              onTap: () {},
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
                                'Cash On Delivery',
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
                                "₹ 190",
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
                                'Order Placed',
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
                                  openGoogleMaps();
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
                                    widget.title == "Completed Orders"
                                        ? 'Delivered'
                                        : widget.title == "Pending Orders"
                                            ? 'Start Ride'
                                            : widget.title == "Out For Delivery"
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
                                push(OrderDetails());
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
