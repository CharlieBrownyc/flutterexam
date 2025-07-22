import 'package:equatable/equatable.dart';
import '../models/todo.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  @override
  List<Object?> get props => [todos];
}
