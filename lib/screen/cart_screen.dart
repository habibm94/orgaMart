import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/decoration_const.dart';

///todo- top priority--do it
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    var cartItems = cartController.cartItems;

    return Scaffold(
      appBar: AppBar(
        ///appbar
        title: Text('My Cart'),
      ),
      body: Container(
        height: 600.h,
        width: double.infinity,
        child: Container(
          height: 450.h,
          color: backgroundContainerColor,
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///cart item section
              Expanded(
                  child: cartItems.isEmpty
                      ? const Text(
                          'empty cart',
                          style: TextStyle(fontSize: 20),
                        )
                      : GetBuilder<Cart_Controller>(
                          init: Cart_Controller(),
                          builder: (controller) => ListView.builder(
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) => Container(
                                    height: 60.h,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 5.h,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 10.w),
                                    decoration: BoxDecoration(
                                        color: containerColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.r)),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: shadowColor,
                                            blurRadius: shadowBlurRadius,
                                            offset: Offset(0, 2),
                                          )
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ///cart item image
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: containerColor,
                                            border: Border.all(
                                                color: borderColor, width: 1.0),
                                          ),
                                          child: ClipOval(
                                            child: Image(
                                              image: AssetImage(
                                                  cartItems[index].imagePath),
                                              fit: BoxFit.cover,
                                              height: 50.h,
                                              width: 55.w,
                                            ),
                                          ),
                                        ),
                                        Text(cartItems[index].name),
                                        Text((cartItems[index].totalWeight)
                                                .toStringAsFixed(1) +
                                            ' ' +
                                            cartItems[index].weightType),
                                        Text(cartItems[index]
                                                .totalPrice
                                                .toStringAsFixed(2) +
                                            ' ' +
                                            '\$'),
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: containerColor,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: shadowColor,
                                                  blurRadius: shadowBlurRadius,
                                                  offset: Offset(0, 2),
                                                )
                                              ]),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              size: 25.sp,
                                            ),
                                            onPressed: () {
                                              print(index);
                                              cartController.cartItems
                                                  .removeAt(index);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                        )),

              ///price and delivery info section
              Container(
                color: containerColor,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
