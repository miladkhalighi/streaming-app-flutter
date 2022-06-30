import 'package:get/get.dart';

class CategoryItemsController extends GetxController{
  var selectedIndex = 0.obs;

  updateIndex(int index){
    selectedIndex.value = index;
  }
}