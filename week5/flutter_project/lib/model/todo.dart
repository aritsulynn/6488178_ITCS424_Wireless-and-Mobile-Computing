import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  bool completed;

  Todo({
    required this.title,
    this.completed = false,
  });
}

class TodoListProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      title: 'Wireless HW',
      completed: false,
    ),
    Todo(
      title: 'P1 Submission',
      completed: true,
    ),
    Todo(
      title: 'Lab 2 PKE',
      completed: false,
    ),
  ];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  void toggleTodoCompleted(Todo todo) {
    todo.completed = !todo.completed;
    notifyListeners();
  }
}
