import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>((event, emit) {
      final updated = List<Todo>.from(state.todos)..add(event.todo);
      _saveTodos(updated);
      emit(TodoState(todos: updated));
    });

    on<ToggleTodo>((event, emit) {
      final updated = List<Todo>.from(state.todos);
      final todo = updated[event.index];
      updated[event.index] = Todo(
        title: todo.title,
        isDone: !todo.isDone,
        due: todo.due,
      );
      _saveTodos(updated);
      emit(TodoState(todos: updated));
    });

    on<RemoveTodo>((event, emit) {
      final updated = List<Todo>.from(state.todos)..removeAt(event.index);
      _saveTodos(updated);
      emit(TodoState(todos: updated));
    });

    on<LoadTodos>((event, emit) async {
      final loaded = await _loadTodos();
      emit(TodoState(todos: loaded));
    });
  }

  void _saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(todos.map((t) => t.toJson()).toList());
    await prefs.setString('todoList', encoded);
  }

  Future<List<Todo>> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('todoList');
    if (data != null) {
      final decoded = jsonDecode(data) as List;
      return decoded.map((e) => Todo.fromJson(e)).toList();
    }
    return [];
  }
}
