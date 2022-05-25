import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/screen/homeScreen.dart';
import 'package:orgamart/main.dart';
import 'package:get/get.dart';
import 'package:orgamart/screen/mainAppScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:confetti/confetti.dart';

class CheckoutSuccess extends StatefulWidget {
  const CheckoutSuccess({Key? key}) : super(key: key);

  @override
  State<CheckoutSuccess> createState() => _CheckoutSuccessState();
}

class _CheckoutSuccessState extends State<CheckoutSuccess> {
//  late ConfettiController _controllerTopCenter;

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );
    return Scaffold(
        body: Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 80.h, bottom: 30.h),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.10,
              right: MediaQuery.of(context).size.width * 0.10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250.h,
                  child: const Image(
                    image: AssetImage(
                        'assets/images/successScreen/deliveryman.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 45.w,
                    ),
                    Expanded(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Purchase Completed  ',
                            textStyle: TextStyle(
                                fontSize: 45.sp,
                                wordSpacing: 10.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.visible),
                            colors: colorizeColors,
                          ),
                        ],
                        totalRepeatCount: 1,
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const AppScreen();
                  }), (route) => false);
                },
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  child: Icon(
                    Icons.home,
                    size: 60.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Home',
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
  }
}
