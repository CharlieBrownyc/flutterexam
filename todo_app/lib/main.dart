import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/ui/todo_page.dart';
import 'bloc/todo_bloc.dart';
import 'bloc/todo_event.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc()..add(LoadTodos()),
      child: MaterialApp(
        title: 'To-Do App',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.teal,
        ),
        home: TodoPage(),
      ),
    );
  }
}