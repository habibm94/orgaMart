class User {
  String userName;
  String? adress;
  int user_mobileNumber;
  String user_email;
  DateTime user_joinDate = DateTime.now().day as DateTime;
  User(
      {required this.userName,
      required this.user_email,
      required this.user_mobileNumber,
      this.adress});
}
