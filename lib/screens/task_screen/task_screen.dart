import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/common_widgets/elevated_button.dart';
import 'package:todo_getx/constants/colors.dart';
import 'package:todo_getx/constants/strings/strings.dart';
import 'package:todo_getx/controllers/main_screen_controller.dart';
import 'package:todo_getx/controllers/task_screen_controllers.dart';
import 'package:todo_getx/screens/task_screen/text_field.dart';

class TaskScreen extends StatelessWidget {
  final MainScreenController mainScreenController =
      Get.find<MainScreenController>();
  final TaskScreenController taskScreenController =
      Get.put(TaskScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(child: TaskScreenTextField()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                      label: StringConstants.taskScreenCancel,
                      onPressed: taskScreenController.gotoMainScreen,
                      color: AppColors.red),
                  CustomElevatedButton(
                      label: taskScreenController.getRightButtonLabel(),
                      onPressed: taskScreenController.getRightButtonOnClick,
                      color: AppColors.green),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
