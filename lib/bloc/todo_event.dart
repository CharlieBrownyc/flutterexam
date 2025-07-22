
import 'package:equatable/equatable.dart';

import '../models/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class AddTodo extends TodoEvent {
  final Todo todo;
  const AddTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}

class ToggleTodo extends TodoEvent {
  final int index;
  const ToggleTodo(this.index);

  @override
  List<Object?> get props => [index];
}

class RemoveTodo extends TodoEvent {
  final int index;
  const RemoveTodo(this.index);

  @override
  List<Object?> get props => [index];
}

class LoadTodos extends TodoEvent {}