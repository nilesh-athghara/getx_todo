import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/constants/colors.dart';
import 'package:todo_getx/controllers/main_screen_controller.dart';

class MainScreenTile extends StatelessWidget {
  final int index;
  MainScreenTile({@required this.index}) : super(key: UniqueKey());

  final MainScreenController mainScreenController =
      Get.find<MainScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(mainScreenController.tasks[index].text,
            style: (mainScreenController.tasks[index].completed)
                ? TextStyle(
                    color: AppColors.red,
                    decoration: TextDecoration.lineThrough)
                : TextStyle(color: AppColors.green)),
        onTap: () {
          mainScreenController.gotoTaskScreen(index: index);
        },
        leading: Checkbox(
          value: mainScreenController.tasks[index].completed,
          onChanged: (val) {
            mainScreenController.updateStatus(val, index);
          },
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline_outlined),
          onPressed: () {
            mainScreenController.remove(index);
          },
        ));
  }
}
