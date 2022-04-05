import 'package:flutter/material.dart';
import 'package:orgamart/decoration_const.dart';
import 'package:orgamart/controller/user_controller.dart';

///todo- complete this screen and create a saved item list in user controller(create bool is saved in item model)
class Saved_screen extends StatelessWidget {
  const Saved_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Items'),
        backgroundColor: appBarColor,
      ),
    );
  }
}
