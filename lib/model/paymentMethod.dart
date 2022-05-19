abstract class PaymentMethod {
  late String Iconpath;
}

class Creditcard extends PaymentMethod {
  Creditcard(
      {required this.name,
      required this.cvv,
      required this.expiryDate,
      required this.cardType});
  String cvv;
  String expiryDate;
  String name;
  String cardType;
}

class Paypal extends PaymentMethod {
  late String email;
  late String name;
  Paypal({required this.name, required this.email});
}

class CashOnDelivery extends PaymentMethod {}
