import 'package:orgamart/model/item.dart';

class Purchase {
  DateTime dateTime;
  double purchaseValue;
  String adress;
  double totalValue;
  List<Item> purchasedItem;
  Purchase(
      {required this.dateTime,
      required this.adress,
      required this.purchaseValue,
      required this.totalValue,
      required this.purchasedItem});
}
