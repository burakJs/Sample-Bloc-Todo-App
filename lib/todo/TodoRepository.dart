import 'package:bloctodoapp/todo/Todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ITodoRepository {
  Future<void> initalSetFunc();
  Future<void> addTodo(String todoTitle);
  Future<void> deleteTodo(int i);
}

class TodoRepository extends ITodoRepository {
  @override
  Future<List<Todo>> initalSetFunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("todos") == null) {
      prefs.setStringList("todos", []);
      return [];
    } else {
      var todosList = <Todo>[];
      for (var todo in prefs.getStringList("todos")) {
        var t = Todo(todo);
        todosList.add(t);
      }
      return todosList;
    }
  }

  @override
  Future<void> addTodo(String todoTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var todosList = prefs.getStringList("todos" ?? []);
    todosList.add(todoTitle);
    prefs.setStringList("todos", todosList);
  }

  @override
  Future<void> deleteTodo(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var todosList = prefs.getStringList("todos" ?? []);
    todosList.removeAt(i);
    prefs.setStringList("todos", todosList);
  }
}
