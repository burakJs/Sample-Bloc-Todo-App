import 'package:bloctodoapp/todo/TodoCubit.dart';
import 'package:bloctodoapp/todo/TodoRepository.dart';
import 'package:bloctodoapp/todo/TodoView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoCubit(TodoRepository()),
        child: TodoView(),
      ),
    );
  }
}
