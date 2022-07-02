import 'package:get/get.dart';
import 'package:streaming_app/controllers/category_items_controller.dart';
import 'package:streaming_app/controllers/session_items_controller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryItemsController());
    Get.lazyPut(() => SessionItemsController());
  }

}