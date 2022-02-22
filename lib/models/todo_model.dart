// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ToDo toDoFromJson(String str) => ToDo.fromJson(json.decode(str));

String toDoToJson(ToDo data) => json.encode(data.toJson());

class ToDo {
  ToDo({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Todo> todos;
  final int total;
  final int skip;
  final int limit;

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  final int id;
  final String todo;
  final bool completed;
  final int userId;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
