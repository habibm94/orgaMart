import 'package:flutter/material.dart';
import 'package:orgamart/controller/shopping_Controller.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/model/item.dart';

class Trending_ProductsTile extends StatelessWidget {
  const Trending_ProductsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.find<Shopping_Controller>();
    final cartController = Get.find<Cart_Controller>();

    List<trendingTile_products> getProductItems() {
      List<trendingTile_products> productItems = shoppingController
          .trendingproducts
          .map((element) => trendingTile_products(
              productImage: element.imagePath,
              name: element.name,
              initial_pricePerunit: element.initial_pricePerUnit,
              trndingItem: element))
          .toList();

      return productItems;
    }

    List<trendingTile_products> trendingtile_Products = getProductItems();
    ;
    return Container(
      padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundContainerColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 10.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending',
              style: TextStyle(
                  fontSize: mainfontSize.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.62,
                  mainAxisSpacing: 6.0),
              children: trendingtile_Products,
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog_trendingProducts({
  required BuildContext context,
}) {
  // set up the buttons
  final cartController = Get.find<Cart_Controller>();

  Widget cartButton = GetBuilder<Cart_Controller>(
    init: Cart_Controller(),
    builder: (cartController) => Center(
      child: ElevatedButton(
        child: const Text(
          "Add to Cart",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          cartController.addtoCart();
          cartController.reset_temp_CartValues();

          Get.back();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          elevation: 10,
          minimumSize: Size(35.w, 35.h),
        ),
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(
        child: Text(
      'ADD TO CART?',
      style: TextStyle(fontSize: 22.sp),
    )),
    content: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.r))),
      height: 200.h,
      width: 210.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            ///item image
            child: Image(
              image: AssetImage(
                cartController.itemImage,
              ),
              fit: BoxFit.cover,
              height: 90.h,
              width: 99.h,
            ),
          ),
          Text(
            ///item name
            cartController.userClickedItem!.name,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            ///regular price
            cartController.price.toString() + ' \$ ',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  ///decrease order button
                  onPressed: () {
                    cartController.orderoftimes > 1
                        ? cartController.decreaseOrder()
                        : null;
                  },
                  child: Icon(
                    Icons.remove,
                    size: 32.sp,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    elevation: 20,
                    shape: const CircleBorder(),
                  ),
                ),
                Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 10.r,
                            color: Colors.black12)
                      ]),
                  child: Center(

                      ///show weight container
                      child: GetBuilder<Cart_Controller>(
                    init: Cart_Controller(),
                    builder: (controller) => Text(
                      (controller.totalweight.toStringAsFixed(2)) +
                          " " +
                          controller.weightType.toString(),
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
                ElevatedButton(
                  ///item add button
                  onPressed: () {
                    cartController.increaseOrder();
                  },
                  child: Icon(
                    Icons.add,
                    size: 32.sp,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    elevation: 20,
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: GetBuilder<Cart_Controller>(
                init: Cart_Controller(),
                builder: (controller) => Text(
                      'Total: ' +
                          ((controller.totalPrice.toStringAsFixed(2)) +
                              ' ' +
                              '\$'),
                    )),
          ),
        ],
      ),
    ),
    actions: [
      cartButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  ).then((value) {
    cartController.reset_temp_CartValues();
  });
}

class trendingTile_products extends StatelessWidget {
  Item trndingItem;
  String productImage;
  String name;
  double initial_pricePerunit;
  trendingTile_products(
      {required this.name,
      required this.initial_pricePerunit,
      required this.productImage,
      required this.trndingItem});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                cartController.addtoUserClickedItem(item: trndingItem);
                showAlertDialog_trendingProducts(
                  context: context,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black12,
                      width: containerBorderwidth.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: shadowBlurRadius.r,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: ClipOval(
                  child: Image(
                    ///image
                    image: AssetImage(productImage),
                    fit: BoxFit.cover,
                  ),
                ),
                height: homepage_productHeight.h,
                width: homePage_ProductWidth.w,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            name,

            ///item name
            style: TextStyle(
                fontSize: name.length > 11 ? 12.sp : 14.sp,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold),
          ),
          Center(
            child: Text(
              ///item price
              initial_pricePerunit.toString() + ' ' + '\$',

              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              cartController.addtoUserClickedItem(item: trndingItem);
              showAlertDialog_trendingProducts(
                context: context,
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              elevation: 10,
              minimumSize: Size(20.w, 32.h),
            ),
            child: Center(
              child: Text(
                'ADD TO CART',
                style: TextStyle(fontSize: 9.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
