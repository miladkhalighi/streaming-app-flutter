import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/controllers/category_items_controller.dart';
import 'package:streaming_app/models/category_item_model.dart';

import 'components/category_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final CategoryItemsController categoryController = Get.put(CategoryItemsController());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.17,
            child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      ()=> CategoryItemWidget(
                        selected: index == categoryController.selectedIndex.value ? true : false,
                        item: categoryItemsList[index],
                        onTap: (){categoryController.updateIndex(index);},
                      ),
                    ),
                  ),
                  itemCount: categoryItemsList.length,
              ),
          )

        ],
      ),
    );
  }
}


