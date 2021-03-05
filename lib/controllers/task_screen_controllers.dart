import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_getx/constants/strings/strings.dart';
import 'package:todo_getx/controllers/main_screen_controller.dart';

class TaskScreenController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final MainScreenController mainScreenController = Get.find();
  int index = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    if (index != null) {
      textEditingController.text = mainScreenController.tasks[index].text;
    }
  }

  getRightButtonLabel() => index == null
      ? StringConstants.taskScreenAdd
      : StringConstants.taskScreenUpdate;

  getRightButtonOnClick() {
    if (index == null) {
      mainScreenController.add(textEditingController.text);
    } else {
      mainScreenController.updateText(textEditingController.text, index);
    }
    Get.back();
  }

  //navigations
  gotoMainScreen() => Get.back();
}
