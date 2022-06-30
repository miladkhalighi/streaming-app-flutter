import 'package:get/get.dart';
import 'package:streaming_app/controllers/category_items_controller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryItemsController());
  }

}