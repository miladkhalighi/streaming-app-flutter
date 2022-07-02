import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:streaming_app/models/session_model.dart';

class SessionItemsController extends GetxController{

  RxList trendList = [].obs;

  RxList getTrendItems(){

    for (var element in sessionList) {
     if(!trendList.contains(element.category.contains('trend'))){
       if(element.category.contains('trend')){
         trendList.add(element);
       }
     }
    }
    return trendList;
  }

}