import 'dart:convert';

class Todo {
  String text;
  bool completed;

  Todo({
    this.text,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      text: json["text"] == null ? null : json["text"] as String,
      completed: json["completed"] == null ? null : json["completed"] as bool);

  Map<String, dynamic> toJson() =>
      {"text": text ?? null, "completed": completed ?? null};
}

//single object
String todoToJson(Todo todo) => json.encode(todo.toJson());
Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

//list of objects
List<Todo> todoFromJsonList(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoModelToJsonList(List<Todo> todo) =>
    json.encode(List<dynamic>.from(todo.map((x) => x.toJson())));
