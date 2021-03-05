import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_getx/constants/url_constants.dart';
import 'package:todo_getx/data/entity/task_model.dart';
import 'package:todo_getx/data/network/network_provider.dart';

class TaskAdapter {
  //separate network provider for each data model will keep us ready for microservices.
  final NetworkProvider _networkProvider =
      NetworkProvider(baseUrl: "${UrlConstants.masterApiUrl}/getx");

  TaskAdapter({Map<String, String> headers = const {}}) {
    _networkProvider.setHeaders(headers);
  }

  Future<List<Task>> loadTasks({@required String uniqueId}) async {
    List<Task> list = [];
    Response response = await _networkProvider
        .get(path: "/fetch", queryParameters: {"uid": uniqueId});
    if (response.statusCode == 200) {
      list = taskFromJsonList(response.data["tasks"]);
    }
    return list;
  }

  Future<Task> addTask(
      {@required String text, @required String uniqueId}) async {
    Task task;
    Response response = await _networkProvider
        .post(path: "/save", data: {"text": text, "uid": uniqueId});
    if (response.statusCode == 200) {
      task = taskFromJson(response.data["task"]);
    }
    return task;
  }

  Future<Task> updateTask({@required String text, @required String id}) async {
    Task task;
    Response response = await _networkProvider.put(
        path: "/update", data: {"text": text}, queryParameters: {"id": id});
    if (response.statusCode == 200) {
      task = taskFromJson(response.data["task"]);
    }
    return task;
  }

  Future<bool> toggleComplete({@required bool val, @required String id}) async {
    bool updated = false;
    Response response = await _networkProvider.put(
        path: "/toggle_complete",
        data: {"completed": val},
        queryParameters: {"id": id});
    if (response.statusCode == 200) updated = true;
    return updated;
  }

  Future<bool> delete({@required String id}) async {
    bool deleted = false;
    Response response = await _networkProvider.delete(
        path: "/delete",
        queryParameters: {"id": id});
    if (response.statusCode == 200) deleted = true;
    return deleted;
  }
}
