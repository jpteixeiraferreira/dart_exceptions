class Account {
  String name;
  double balance;
  bool isAuthenticated;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated});

  editBalance({required value}) {
    balance = balance + value;
  }

  String ToString(){
    return
      "Name: $name\n" +
      "Balance: $balance\n" +
      "Authenticated?: $isAuthenticated.";
  }

}
