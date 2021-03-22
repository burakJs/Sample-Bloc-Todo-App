import 'package:bloc/bloc.dart';
import 'package:bloctodoapp/todo/TodoRepository.dart';
import 'package:bloctodoapp/todo/TodoState.dart';

class TodoCubit extends Cubit<TodoState> {
  // ignore: unused_field
  final TodoRepository _todoRepository;

  TodoCubit(this._todoRepository) : super(TodoInitial());

  Future<void> initial() async {
    try {
      emit(TodoLoading());
      final todoList = await _todoRepository.initalSetFunc();
      emit(TodoLoaded(todoList));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> add(String todo) async {
    try {
      emit(TodoLoading());
      await _todoRepository.addTodo(todo);
      final todoList = await _todoRepository.initalSetFunc();
      emit(TodoLoaded(todoList));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delete(int i) async {
    try {
      emit(TodoLoading());
      await _todoRepository.deleteTodo(i);
      final todoList = await _todoRepository.initalSetFunc();
      emit(TodoLoaded(todoList));
    } catch (e) {
      throw Exception(e);
    }
  }
}
