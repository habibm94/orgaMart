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
            Container(
              height: 24.h,
              decoration: const BoxDecoration(color: containerColor),
            ),
            Container(
              height: 40.h,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: shadowBlurRadius,
                    color: shadowColor)
              ]),
              child: Center(
                  child: Text(
                'Orgamart',
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 10.sp),
              )),
            ),
            const ProductsTile(),
            const Divider(
              color: Colors.black54,
            ),
            const Discounted_ProductsTile(),
            const Divider(
              color: Colors.black54,
            ),
            const Trending_ProductsTile(),
          ],
        ),
      ),
    );
  }
}
