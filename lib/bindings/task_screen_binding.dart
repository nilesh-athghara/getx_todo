import 'package:get/get.dart';
import 'package:todo_getx/controllers/task_screen_controllers.dart';

class TaskScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskScreenController());
  }
}
