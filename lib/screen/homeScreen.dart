import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:orgamart/widgets/homescreen/productstile.dart';
import 'package:orgamart/widgets/homescreen/discounted_Producttile.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/widgets/homescreen/trendingProductsTile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundContainerColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 140.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.teal, Colors.green.shade200],
                    ),
                  ),
                  child: Center(
                      child: Text(
                    'Orgamart',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 10.sp),
                  )),
                ),
                Container(
                  height: 20.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                ),
              ],
            ),
            const ProductsTile(),
            const Divider(
              color: Colors.black54,
            ),
            const Discounted_ProductsTile(),
            const Divider(
              color: Colors.black54,
            ),
            Trending_ProductsTile(),
          ],
        ),
      ),
    );
  }
}
