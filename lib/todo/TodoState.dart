import 'package:bloctodoapp/todo/Todo.dart';

abstract class TodoState {
  const TodoState();
}

class TodoInitial extends TodoState {
  const TodoInitial();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  final List<Todo> todo;
  const TodoLoaded(this.todo);
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
}
