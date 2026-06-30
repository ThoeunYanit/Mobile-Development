import '../models/expense.dart';
import '../repository/expense_repository.dart';

// void main() async {

  
//   print("Fetching expense");

//   Expense expense = await expenseRepository.fetchExpense();
//   print("  expense fetched : ${expense.title}");
// }

void main() async {

  
  print("Fetching expense");

  List<Expense> expense = await expenseRepository.fetchExpense();
  for (var value in expense){

    print("  expense fetched : ${value.title}");
  }
}