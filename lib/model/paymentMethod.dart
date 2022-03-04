class Card_paymentDetails {
  String bankName;
  int cvv;
  String cardHolderName;
  String expireDate;
  Card_paymentDetails(
      {required this.cardHolderName,
      required this.bankName,
      required this.cvv,
      required this.expireDate});
}
