import 'dart:ui';
import 'package:orgamart/screen/confirm_and_paymentPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import 'package:orgamart/decoration_const.dart';

class Checkout_screen extends StatelessWidget {
  const Checkout_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    final userController = Get.find<User_Controller>();
    var cartitemList = userController.checkoutcartItems;
    List<Widget> createexpansionTileWidgets() {
      var cartitemList = userController.checkoutcartItems;
      List<Widget> expansionTileWidgets = <Widget>[];
      cartitemList.forEach((element) {
        Widget itemTile = ListTile(
          title: Text(element.name),
          leading: ClipOval(
            child: Image(
              image: AssetImage(element.imagePath),
              height: 30.h,
              width: 33.w,
            ),
          ),
          subtitle:
              Text(element.totalWeight.toString() + ' ' + element.weightType),
          trailing: Text(element.totalPrice.toString() + ' ' + '\$'),
        );
        return expansionTileWidgets.add(itemTile);
      });
      return expansionTileWidgets;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),

              ///confirm order title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Confirm Order',
                    style: TextStyle(
                      fontSize: 25.sp,
                      wordSpacing: 10.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                color: Colors.white,
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors.white,
                  title: Text(
                    'Your Orders',
                    style: TextStyle(
                      fontSize: 20.sp,
                      wordSpacing: 10.sp,
                    ),
                  ),
                  children: createexpansionTileWidgets(),
                ),
              ),
              const Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 5.w),
                child: Column(
                  children: [
                    ///total price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Total Price: ', style: checkoutScreenTextstyle),
                        Text(
                          '${userController.totalPrice}' + ' ' + '\$',
                          style: TextStyle(
                              fontSize: 20.sp,
                              wordSpacing: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(),

                    ///discount coupon
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Discount Coupon: ',
                            style: checkoutScreenTextstyle),
                        Text(
                          userController.couponapplied == true
                              ? (userController.appliedCoupon.toString() +
                                  ' ' +
                                  '\$')
                              : '0 %',
                          style: TextStyle(
                              fontSize: 20.sp,
                              wordSpacing: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print('apply coupon button got pressed');
                          },
                          child: Text(userController.couponapplied == true
                              ? 'Change Coupon'
                              : 'Apply Coupon'),
                        )
                      ],
                    ),
                    Divider(),

                    ///delivery fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Delivery Fee: ', style: checkoutScreenTextstyle),
                        Text(
                          userController.deliveryfee.toString() + " " + '\$',
                          style: TextStyle(
                              fontSize: 20.sp,
                              wordSpacing: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(),

                    ///amount to pay
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Amount to pay: ', style: checkoutScreenTextstyle),
                        Text(
                          userController.amounttoPay.toString() + ' ' + '\$',
                          style: TextStyle(
                              fontSize: 20.sp,
                              wordSpacing: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print('confirm order buton got pressed');
                            Get.to(PaymentPage());
                          },
                          child: Text(
                            'Confirm order',
                            style: checkoutScreenTextstyle,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
