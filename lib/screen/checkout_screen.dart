import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orgamart/model/item.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:orgamart/controller/user_controller.dart';
import '../controller/cart_controller.dart';

class Checkout_screen extends StatelessWidget {
  const Checkout_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    final userController = Get.find<USer_Controller>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(userController.totalPrice.toString()),
      ),
    );
  }
}
