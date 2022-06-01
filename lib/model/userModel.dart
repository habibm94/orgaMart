import 'dart:io';

import 'package:orgamart/model/adress.dart';
import 'package:orgamart/model/purchases.dart';
import 'package:hive_flutter/hive_flutter.dart';

class User extends HiveObject {
  late String name;
  late File userImage;
  late Adress userAdress;
  late String mobileNumber;
  late String point;
  late String level;
}
