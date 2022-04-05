import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/controller/user_controller.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<User_Controller>();
    return Scaffold(
      appBar: AppBar(
        title: Text(' Almost Done'),
        backgroundColor: appBarColor,
      ),
      body: Container(
        child: Text('payment page'),
      ),
    );
  }
}
