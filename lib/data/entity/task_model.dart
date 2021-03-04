import 'dart:convert';

class Task {
  String id;
  String text;
  bool completed;

  Task({
    this.text,
    this.id,
    this.completed = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      id: json["_id"],
      text: json["text"] == null ? null : json["text"] as String,
      completed: json["completed"] == null ? null : json["completed"] as bool);

  Map<String, dynamic> toJson() =>
      {"text": text ?? null, "completed": completed ?? null, "_id": id};
}

//single object
String taskToJson(Task todo) => json.encode(todo.toJson());
Task taskFromJson(Map str) => Task.fromJson(str);

//list of objects
List<Task> taskFromJsonList(List str) =>
    List<Task>.from(str.map((x) => Task.fromJson(x)));

String taskModelToJsonList(List<Task> todo) =>
    json.encode(List<dynamic>.from(todo.map((x) => x.toJson())));
