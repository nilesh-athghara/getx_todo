import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/constants/strings/strings.dart';
import 'package:todo_getx/controllers/main_screen_controller.dart';
import 'package:todo_getx/screens/main_screen/main_screen_tile.dart';

class MainScreen extends StatelessWidget {
  final MainScreenController mainScreenController =
      Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.mainScreenAppBar),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              mainScreenController.gotoTaskScreen();
            }),
        body: Container(
          child: Obx(() => ListView.separated(
              itemBuilder: (context, index) {
                return MainScreenTile(index: index);
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: mainScreenController.tasks.length)),
        ));
  }
}
