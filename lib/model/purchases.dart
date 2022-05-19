import 'package:orgamart/model/item.dart';
import 'package:orgamart/model/paymentMethod.dart';

class Purchase {
  String dateTime;
  double purchaseValue;
  String adress;

  List<Item> purchasedItem;
  String paymentmentmethodname;

  Purchase(
      {required this.dateTime,
      required this.adress,
      required this.purchaseValue,
      required this.purchasedItem,
      required this.paymentmentmethodname});
}
