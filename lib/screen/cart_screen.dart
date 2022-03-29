import 'package:flutter/material.dart';
import 'package:orgamart/controller/cart_controller.dart';
import 'package:get/get.dart';

///todo- top priority--do it
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<Cart_Controller>();
    return const SingleChildScrollView();
  }
}
