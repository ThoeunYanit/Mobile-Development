import 'package:flutter/material.dart';

import '../../../data/repository/repository_exception.dart';

import '../../../data/repository/todo_repository.dart';
import '../../../models/todo.dart';
import '../../theme/app_screen.dart';
import '../../utils/async_data.dart';
import 'todo_card.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  AsyncData<List<Todo>> asyncData = AsyncData.notstarted();

  @override
  void initState() {
    super.initState();

    // Fetch todos on init state
    _fetchTodos();
  }

  void _fetchTodos() async {
    TodoRepository repository = TodoRepository.global;

    //  TODO
    // Fetch the list of todos from the repo
    // Handle the success, loading and error cases (catch exception)
    // Update the widget state (asyncData)

    // List<Todo> todos = await repository.getTodos();
    // setState(() => asyncData = AsyncData.success(todos),);

    List<Todo> todos = await repository.getTodos();
    setState(() => asyncData = AsyncData.loading());

    try {
      setState(() => asyncData = AsyncData.success(todos));
    } on RepositoryException catch (e) {
      throw Exception(e.message);
    }
  }

  void onUpdateCompleted(Todo todo) async {
    TodoRepository repository = TodoRepository.global;

    //  TODO
    // Update the todo from the repo
    // Handle the success, loading and error cases (catch exception)
    // Update the widget state (asyncData)

    // ! we dont reload the full list, we update directly the modified Todo in the cache (asyncData)
    try {
      await repository.updateCompleted(todo.id,!todo.completed); // !todo.completed to change the state of completed from true to false or false to true
      // _fetchTodos(); // to rebuild ui // Since I am not sure with caching, I will use _fetchTodos to reload everyhting like a fresh start
      
      setState(() {
        
        var todos = asyncData.value!; //assign todos with list of todo (asyncData.value) 
        int index = todos.indexWhere((e) => e.id == todo.id); // loop into the list (todos) to compare id of argument with id of value of index
        todos[index] = todos[index].copyWith(!todo.completed); // change the value that matches in the list with the argument
    
      });

    } on RepositoryException {
      throw Exception('Update fails');
    }
  }

  Widget get content => switch (asyncData.status) {
    AsyncStatus.notstarted => Text(
      "Tap to refresh",
      style: AppTheme.paragraph.copyWith(color: AppTheme.redColor),
    ),

    AsyncStatus.loading => CircularProgressIndicator(),

    AsyncStatus.success => _buildTodos(),

    AsyncStatus.error => _buildError(),
  };

  Widget _buildTodos() {
    List<Todo> todos = asyncData.value!;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) =>
          TodoCard(todo: todos[index], onTap: onUpdateCompleted),
    );
  }

  Widget _buildError() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.warning, color: AppTheme.redColor),
        SizedBox(width: 10),

        Text(
          asyncData.error!,
          style: AppTheme.paragraph.copyWith(color: AppTheme.redColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        title: Text("Welcome !", style: AppTheme.heading),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: content),
      ),
    );
  }
}
