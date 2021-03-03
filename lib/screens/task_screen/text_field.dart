import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/constants/strings/strings.dart';
import 'package:todo_getx/controllers/task_screen_controllers.dart';

class TaskScreenTextField extends StatelessWidget {
  final TaskScreenController taskScreenController =
      Get.find<TaskScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: taskScreenController.textEditingController,
      style: TextStyle(fontSize: 24.0),
      keyboardType: TextInputType.visiblePassword,
      maxLines: 599,
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: StringConstants.taskScreenHint),
    );
  }
}
