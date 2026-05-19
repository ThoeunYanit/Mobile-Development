class BankAccount {
  // TODO
  String owner;
  int id;
  double _balance = 0;

  BankAccount(this.owner, this.id);

  double get balance => _balance;

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  // TODO
  String name;
  List<BankAccount> _accounts = [];

  Bank({required this.name});

  List<BankAccount> get accounts => _accounts;

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account.id == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }

    final newAccount = BankAccount(accountOwner, accountId);
    _accounts.add(newAccount);
    return newAccount;
  }

  // void printAccounts() {
  //   for (var acc in _accounts) {
  //     print(
  //       'Account ID: ${acc.id}, Owner: ${acc.owner}, Balance: ${acc.balance}',
  //     );
  //   }
  // }

}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(101, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }

  // myBank.printAccounts();
}
