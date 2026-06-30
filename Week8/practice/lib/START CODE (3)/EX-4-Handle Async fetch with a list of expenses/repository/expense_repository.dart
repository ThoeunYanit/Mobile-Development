import '../models/expense.dart';

class ExpenseRepository {
  Expense singelExpense = Expense(amount: 45, title: "fake");

  List<Expense> listExpense = [
    Expense(amount: 19.99, title: 'Flutter Course'),
    Expense(title: 'Cinema', amount: 15.69),
    Expense(title: 'Salad', amount: 15.69),
    Expense(title: 'Guitar', amount: 22.69),
  ];

  // Future<Expense> fetchExpense() {
  //   // Simulate 5 seconds before returnning the success fetch
  //   return Future.delayed(Duration(seconds: 5), () {
  //     return singelExpense;
  //   });
  // }

  Future<List<Expense>> fetchExpense() {
    // Simulate 5 seconds before returnning the success fetch
    return Future.delayed(Duration(seconds: 5), () {
      return listExpense;
    });
  }
}

class ExpenseException implements Exception {
  final String message;
  ExpenseException(this.message);

  @override
  String toString() => message;
}

// final ExpenseRepository expenseRepository =
//     ExpenseRepository(); // global access for now



final ExpenseRepository expenseRepository =
    ExpenseRepository(); 
