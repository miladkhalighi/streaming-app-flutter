import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app/controllers/category_items_controller.dart';
import 'package:streaming_app/models/category_item_model.dart';

import 'components/category_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.05;
    final CategoryItemsController categoryController = Get.put(CategoryItemsController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFAFE),
        appBar: buildAppBar(bodyMargin),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //category view
            SizedBox(
              height: size.height / 7.31,
              child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) => Padding(
                      padding: EdgeInsets.fromLTRB(index==0 ? bodyMargin : 8,0,8,0),
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
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.only(left: bodyMargin),
              child: Text('Sessions You May Like',style: GoogleFonts.poppins(fontSize: 20,color: Colors.black),),
            ),
            const SizedBox(height: 16,),
            SizedBox(
              height: size.height/3,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.fromLTRB(index==0 ? bodyMargin : 8,0,8,0),
                      child: SessionItemWidget(),
                    );
                  }),
            )



          ],
        ),
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

class SessionItemWidget extends StatelessWidget {
  const SessionItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width/2,
      child: Stack(
        children: [
          //image
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(image: AssetImage('assets/images/user1.png'),fit: BoxFit.cover)
            ),
          ),
          //botoom texts
          Positioned(
            bottom: 20,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundImage : AssetImage('assets/images/user1.png'),radius: 12,),
                    const SizedBox(width: 8,),
                    Text('Sara',style: GoogleFonts.prompt(fontSize: 9,color: Colors.white),),
                  ],
                ),
                Text('Hello from Pakistan',style: GoogleFonts.poppins(fontSize: 14,color: Colors.white),),
              ],
            ),
          ),
          //top left
          Positioned(
            top: 20,
            left: 16,
            child: Row(
              children: [
                const Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                const SizedBox(width: 4,),
                Text('6.4K',style: GoogleFonts.poppins(fontSize: 10,color: Colors.white),)
              ],
            ),
          ),
          //top right
          Positioned(
            top: 14,
            right: 16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                      colors: [
                    Color(0xFFF15887),
                    Color(0xFFFD769E),
                    Color(0xFFFE9B86),
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const SizedBox(width: 16,),
                      SvgPicture.asset('assets/icons/activity.svg',color: Colors.white.withOpacity(0.8),),
                      const SizedBox(width: 16,),
                      Text('Live',style: GoogleFonts.prompt(fontSize: 9,color: Colors.white),),
                      const SizedBox(width: 16,),
                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}


