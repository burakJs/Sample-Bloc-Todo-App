import 'package:bloctodoapp/todo/TodoCubit.dart';
import 'package:bloctodoapp/todo/TodoState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  var tfTodo = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoCubit>(context).initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDos'),
      ),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TodoInitial) {
            return initialView();
          }
          if (state is TodoLoading) {
            return CircularProgressIndicator();
          }
          if (state is TodoLoaded) {
            return loadedView(state);
          } else {
            return errorView();
          }
        },
      ),
      floatingActionButton: addButton(context),
    );
  }

  FloatingActionButton addButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        BlocProvider.of<TodoCubit>(context).add(tfTodo.text);
        tfTodo.clear();
      },
    );
  }

  Center initialView() {
    return Center(
      child: Text("inital"),
    );
  }

  Center errorView() {
    return Center(
      child: Text("ERROR"),
    );
  }

  Widget loadedView(TodoLoaded state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: tfTodo,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.todo.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.todo[index].todo),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                  ),
                  color: Colors.red,
                  onPressed: () {
                    BlocProvider.of<TodoCubit>(context).delete(index);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
