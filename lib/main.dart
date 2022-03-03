import 'package:flutter/material.dart';
import 'package:orgamart/screen/homeScreen.dart';

void main() {
  runApp(const OrgaMart());
}

class OrgaMart extends StatelessWidget {
  const OrgaMart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[400],
        ),
        home: const HomeScreen());
  }
}
