import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_getx/data/entity/task_model.dart';
import 'package:todo_getx/screens/task_screen/task_screen.dart';

//this class contains all the variables and ui logic related to main screen
class MainScreenController extends GetxController {
  RxList<Todo> tasks = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    //check if a list is already stored
    List stored = GetStorage().read<List>("tasks");
    if (stored != null) {
      tasks = RxList(stored.map((e) => Todo.fromJson(e)).toList());
    }
    //"ever" means will be called every time task list changes
    ever(tasks, (_) => {GetStorage().write("tasks", tasks.toList())});
  }

  add(String val) => tasks.add(Todo(text: val));

  updateText(String val, int index) {
    Todo toChange = tasks[index];
    toChange.text = val;
    tasks[index] = toChange;
  }

  updateStatus(bool val, int index) {
    Todo toChange = tasks[index];
    toChange.completed = val;
    tasks[index] = toChange;
  }

  remove(int index) {
    Todo task = tasks[index];
    tasks.removeAt(index);
    Get.snackbar("Task Removed", "",
        mainButton: FlatButton(
            onPressed: () {
              if (task != null) {
                tasks.insert(index, task);
                task = null;
              }
            },
            child: Text("Undo")));
  }

  //navigations
  gotoTaskScreen({int index}) => Get.to(() => TaskScreen(), arguments: [index]);
}
