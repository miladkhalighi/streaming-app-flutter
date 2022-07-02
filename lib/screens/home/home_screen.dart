import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app/controllers/category_items_controller.dart';
import 'package:streaming_app/controllers/session_items_controller.dart';
import 'package:streaming_app/models/category_item_model.dart';
import 'package:streaming_app/models/session_model.dart';

import 'components/category_item_widget.dart';
import 'components/session_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final CategoryItemsController categoryController = Get.put(CategoryItemsController());
  final SessionItemsController sessionItemsController = Get.put(SessionItemsController());

  @override
  void initState() {
      sessionItemsController.getTrendItems();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFAFE),
        appBar: buildAppBar(bodyMargin),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              ///category view
              categotyItemsView(size, bodyMargin),
              const SizedBox(height: 16,),
              Padding(
                padding: EdgeInsets.only(left: bodyMargin),
                child: Text('Sessions You May Like',style: GoogleFonts.poppins(fontSize: 20,color: Colors.black),),
              ),
              const SizedBox(height: 16,),
              ///session like View
              sessionLikeView(size, bodyMargin),
              const SizedBox(height: 32,),
              Padding(
                padding: EdgeInsets.only(left: bodyMargin),
                child: Text('Trending Session',style: GoogleFonts.poppins(fontSize: 20,color: Colors.black),),
              ),
              const SizedBox(height: 16,),
              /// session trending view
              sessionTrendingView(size, bodyMargin),
              const SizedBox(height: 32,),



            ],
          ),
        ),
      ),
    );
  }

  SizedBox sessionTrendingView(Size size, double bodyMargin) {
    return SizedBox(
              height: size.height/3,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: sessionItemsController.trendList.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.fromLTRB(index==0 ? bodyMargin :10,0,index==sessionItemsController.trendList.length-1 ? bodyMargin : 10,0),
                      child: SessionItemWidget(
                        item: sessionItemsController.trendList[index],
                      ),
                    );
                  }),
            );
  }
  Widget sessionLikeView(Size size, double bodyMargin) {
    return SizedBox(
              height: size.height/3,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: sessionList.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.fromLTRB(index==0 ? bodyMargin :10,0,index==sessionList.length-1 ? bodyMargin : 10,0),
                      child: SessionItemWidget(item: sessionList[index],),
                    );
                  }),
            );
  }
  Widget categotyItemsView(Size size, double bodyMargin) {
    return SizedBox(
              height: size.height / 7.31,
              child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) =>
                      Obx(
                        ()=> Padding(
                          padding: EdgeInsets.fromLTRB(index==0 ? bodyMargin : 10,0,index==categoryItemsList.length-1 ? bodyMargin : 10,0),
                          child: CategoryItemWidget(
                            selected: index == categoryController.selectedIndex.value ? true : false,
                            item: categoryItemsList[index],
                            onTap: (){categoryController.updateIndex(index);},
                          ),
                        ),
                      ),
                    itemCount: categoryItemsList.length,
                ),
            );
  }
  AppBar buildAppBar(double bodyMargin) {
    return AppBar(
        backgroundColor: const Color(0xFFFCFAFE),
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: bodyMargin,),
            IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/menu.svg')),
            const Spacer(),
            IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/search.svg'),),
            SizedBox(width: bodyMargin,)
          ],
        ),
      );
  }


}




