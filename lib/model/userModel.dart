import 'dart:io';

import 'package:orgamart/model/adress.dart';
import 'package:orgamart/model/purchases.dart';

class User {
  late String name;
  late File userImage;
  late Adress userAdress;
  late List<Purchase> recentPurchase;
  late String mobileNumber;
  late String point;
  late String level;
}
