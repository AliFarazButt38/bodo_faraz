import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  // final List<Widget> _containerList = [
  //   Container(
  //     width: 292.w,
  //     height: 537.h,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.only(
  //         topRight: Radius.circular(10),
  //         topLeft: Radius.circular(10),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3),
  //           spreadRadius: 3,
  //           blurRadius: 7,
  //           offset: Offset(0, 3),
  //         ),],
  //     ),
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 134.6.h,
  //           width: 292.w,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(10),
  //               topLeft: Radius.circular(10),
  //             ),
  //             color: Color(0xffEAB705),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  //   Container(
  //     width: 292.w,
  //     height: 537.h,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.only(
  //         topRight: Radius.circular(10),
  //         topLeft: Radius.circular(10),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3),
  //           spreadRadius: 3,
  //           blurRadius: 7,
  //           offset: Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 134.6.h,
  //           width: 292.w,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(10),
  //               topLeft: Radius.circular(10),
  //             ),
  //             color: Color(0xffEAB705),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  //   Container(
  //     width: 292.w,
  //     height: 537.h,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.only(
  //         topRight: Radius.circular(10),
  //         topLeft: Radius.circular(10),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3),
  //           spreadRadius: 3,
  //           blurRadius: 7,
  //           offset: Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 134.6.h,
  //           width: 292.w,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(10),
  //               topLeft: Radius.circular(10),
  //             ),
  //             color: Color(0xffEAB705),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
    );
  }
}
