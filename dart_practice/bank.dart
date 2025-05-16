class BankAccount {
  static List allAccounts = [];
  static int accountCount = 0;
  String accHolderName;
  int accNumber;
  double balance = 0;

  BankAccount({required this.accHolderName, required this.accNumber}) {
    accountCount++;
    allAccounts.add(this);
    print('--------------------');
    print('✅ New Account created for $accHolderName');
  }
  printDetails() {
    print('AccountHolder : $accHolderName , AccountNumber: $accNumber');
  }

  depositMoney(double amount) {
    if (amount <= 0) {
      print('Cant be Depsited because the amount is $amount');
      return;
    }

    balance += amount;
    print('Amount is successfully deposited rupees $amount');
    checkBalance();
  }

  withDraw(double amount) async {
    print('Withdrawing amount $amount .....');
    await Future.delayed(Duration(seconds: 3));

    if (amount > balance || amount.isNegative) {
      print('$amount cant be withdrawed ❌.');

      return;
    } else {
      print('Trancsation Completed ✅');
    }
    balance -= amount;
    print('Money withdrawal of rupees $amount is successfully done✅.');
    print('Remaining Balance of $accHolderName is $balance');
  }

  checkBalance() {
    print('Current Account balance of $accHolderName is: $balance');
  }

  void transferMoney(BankAccount toAccount, double amount) {
    if (amount <= 0) {
      print("Money Cant be tansferred");
      return;
    }
    if (this == toAccount) {
      print('Cannot be Transferred to the same account');
      return;
    }
    if (amount > this.balance) {
      print('Insufficient Balance');
      return;
    }
    this.balance -= amount;
    toAccount.balance += amount;
    print(
      "$amount transferred from ${this.accHolderName} to ${toAccount.accHolderName}",
    );
    checkBalance();
  }
}

void main() async {
  BankAccount ijas = BankAccount(
    accHolderName: "ijas",
    accNumber: 323432434324,
  );
  ijas.depositMoney(500);

  BankAccount abdulla = BankAccount(
    accHolderName: 'Abdul Sathar',
    accNumber: 712343769346,
  );
  abdulla.checkBalance();
  ijas.transferMoney(abdulla, 400);
  abdulla.checkBalance();
  ijas.withDraw(50);
}
