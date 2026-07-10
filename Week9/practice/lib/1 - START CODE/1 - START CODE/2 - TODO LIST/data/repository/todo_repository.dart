import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:practice/1%20-%20START%20CODE/1%20-%20START%20CODE/1%20-%20BUTTON/data/repository/repository_exception.dart';
import 'package:practice/1%20-%20START%20CODE/1%20-%20START%20CODE/2%20-%20TODO%20LIST/data/dto/todo_dto.dart';

import '../../models/todo.dart';

class TodoRepository {
  static final global = TodoRepository(); // unique instance

  final List<Todo> fakeTodos = [
    Todo(id: '1', title: 'Buy groceries', completed: false),
    Todo(id: '2', title: 'Finish Flutter homework', completed: true),
    Todo(id: '3', title: 'Call the dentist', completed: false),
    Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
    Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  ];

  Future<List<Todo>> getTodos() async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
    Uri url = Uri.parse(
      'https://week9-exercise2-default-rtdb.asia-southeast1.firebasedatabase.app/.json',
    );

    Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw RepositoryException('An error ocurred');
    }

    // data is acutally json
    Map<String, dynamic> data = jsonDecode(response.body);

    // Convert each entry using fromJson
    final List<Todo> todos = data.entries.map((entry) {
      final id = entry.key;
      final json = entry.value as Map<String, dynamic>;

      return TodoDto.fromJson(id, json);
    }).toList(); // this will create list of Todo Object

    return Future.delayed(Duration(seconds: 1), () {
      // return list of Todo Objects
      return todos;

      //  TODO
      // Ensure the message is displayed on the UI if error occured
      //throw RepositoryException("No wifi !");
    });
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
    // int index = fakeTodos.indexWhere((e) => e.id == todoId);
    // fakeTodos[index] = fakeTodos[index].copyWith(completed);

    // return Future.delayed(Duration(microseconds: 1), () => true);

    Uri url = Uri.parse(
      'https://week9-exercise2-default-rtdb.asia-southeast1.firebasedatabase.app/$todoId.json',
    );



    Map<String, dynamic> json = {'completed': completed};

    return Future.delayed(Duration(microseconds: 1), () async {
      Response response = await http.patch(url, body: jsonEncode(json));

      if (response.statusCode != 200) {
        throw RepositoryException('The error occured');
      }
    });
  }
}
