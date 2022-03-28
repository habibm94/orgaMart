import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:orgamart/widgets/productstile.dart';
import 'package:orgamart/widgets/discounted_Producttile.dart';
import 'package:orgamart/decoration_const.dart';

///todo- create alertdialog on clicking products
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final shoppingController = Get.put(Shopping_controller());
    return Container(
      color: backgroundContainerColor,
      child: SingleChildScrollView(
        //physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 24.h,
              decoration: BoxDecoration(color: containerColor),
            ),
            Container(
              height: 40.h,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: shadowBlurRadius,
                    color: shadowColor)
              ]),
              child: const Center(
                  child: Text(
                'Orgamart',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, wordSpacing: 10),
              )),
            ),
            ProductsTile(),
            Divider(
              color: Colors.black54,
            ),
            Discounted_ProductsTile(),
            Divider(
              color: Colors.black54,
            ),
            ProductsTile(),
          ],
        ),
      ),
    );
  }
}
