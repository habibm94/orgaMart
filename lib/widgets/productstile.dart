import 'dart:ui';
import 'package:orgamart/decoration_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/shopping_Controller.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(Shopping_controller());
    List<ProductsTile_products> getProductItems() {
      List<ProductsTile_products> productItems = shoppingController.products
          .map((element) => ProductsTile_products(
              imagePath: element.imagePath, name: element.name))
          .toList();

      return productItems;
    }

    ;
    List<ProductsTile_products> tileProducst = getProductItems();

    return Container(
      height: 420.h,
      decoration: BoxDecoration(
        color: backgroundContainerColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 0.w,
          right: 10.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                'Products',
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Wrap(children: tileProducst),
          ],
        ),
      ),
    );
  }
}

class ProductsTile_products extends StatelessWidget {
  String imagePath;
  String name;
  ProductsTile_products({Key? key, required this.imagePath, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: 1.5.w,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: shadowBlurRadius,
                    offset: Offset(0, 2),
                  )
                ]),
            child: ClipOval(
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            height: 80.h,
            width: 88.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
