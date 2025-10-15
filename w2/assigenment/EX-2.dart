class BankAccount {
    // TODO
    final String _accountOwner;
    double _balance;
    final int _accountId;
    BankAccount(this._accountOwner, this._accountId, this._balance);

    double get balance => _balance;
    int get accountId => _accountId;
    void withdraw(double amount) {
      if (amount > _balance || amount <= 0) throw "The balance is not enough to withdraw";
      if (_balance == 0) throw "Sorry you have no amount in your balance";
      _balance = _balance - amount;
    }
    void credit(double amount) {
      if(amount <= 0 ) throw "invalid amount, Please input again";
      _balance += amount;
      // return "you have deposit successfully";
    }
}

class Bank {
    // TODO
  final String name;
  final List<BankAccount> _accounts = [];
  // final BankAccount bankAccount;
  Bank({required this.name});
  // Bank.CreateAccount(this.name, BankAccount bankAccount) : bankAccount = bankAccount;
  BankAccount createAccount(int accountId, String accountOwner, [double balance = 0 ]) {

    if(_accounts.any((FindAccountId) => FindAccountId._accountId == accountId)) throw "The account id: $accountId is already exist";
    BankAccount newAccount = BankAccount(accountOwner, accountId, balance);
    _accounts.add(newAccount);
    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(400,'Ronan');

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
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}


