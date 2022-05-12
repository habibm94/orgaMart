abstract class PaymentMethod {
  late String Iconpath;
}

class Creditcard extends PaymentMethod {
  Creditcard({required this.name, required this.cvv, required this.expiryDate});
  late String cvv;
  late String expiryDate;
  late String name;
}

class Paypal extends PaymentMethod {
  late String email;
  late String name;
  Paypal({required this.name, required this.email});
}

class CashOnDelivery extends PaymentMethod {}
