import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_getx/constants/strings/strings.dart';
import 'package:todo_getx/controllers/main_screen_controller.dart';

class TaskScreenController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  MainScreenController mainScreenController = Get.find<MainScreenController>();
  List arguments = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    if (arguments[0] != null) {
      textEditingController.text =
          mainScreenController.tasks[arguments[0]].text;
    }
  }

  getRightButtonLabel() => arguments[0] == null
      ? StringConstants.taskScreenAdd
      : StringConstants.taskScreenUpdate;

  getRightButtonOnClick() {
    if (arguments[0] == null) {
      mainScreenController.add(textEditingController.text);
    } else {
      mainScreenController.updateText(textEditingController.text, arguments[0]);
    }
    Get.back();
  }

  //navigations
  gotoMainScreen() => Get.back();
}
