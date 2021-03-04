import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/data/adapters/task_adapter.dart';
import 'package:todo_getx/data/entity/task_model.dart';
import 'package:todo_getx/screens/task_screen/task_screen.dart';
import 'package:todo_getx/utilities/device_info.dart';

//this class contains all the variables and ui logic related to main screen
class MainScreenController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;
  TaskAdapter taskAdapter = TaskAdapter();
  RxBool loading = true.obs;
  String deviceId;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    //load stored data
    deviceId = await DeviceInfo.getDeviceId();
    List<Task> list = await taskAdapter.loadTasks(uniqueId: deviceId);
    tasks.addAll(list);
    //hide loader
    loading.value = false;
  }

  add(String val) async {
    Task task = await taskAdapter.addTask(text: val, deviceId: deviceId);
    if (task != null) tasks.add(task);
  }

  updateText(String val, int index) async {
    Task changed = await taskAdapter.updateTask(text: val, id: tasks[index].id);
    if (changed != null) tasks[index] = changed;
  }

  updateStatus(bool val, int index) {
    Task toChange = tasks[index];
    toChange.completed = val;
    tasks[index] = toChange;
  }

  remove(int index) {
    Task task = tasks[index];
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
