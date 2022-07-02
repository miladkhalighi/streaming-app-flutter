import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app/models/session_model.dart';

class DetailsSceen extends StatelessWidget {
  final SessionModel item;
  const DetailsSceen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(item.imagePath),fit: BoxFit.cover)
          ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              /// appBar
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    const SizedBox(width: 8,),
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_ios),color: Colors.white,),
                    const Spacer(),
                    Container(
                      width: 12,height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                            colors: [
                          Color(0xFFF15887),
                          Color(0xFFFD769E),
                          Color(0xFFFE9B86),
                        ])
                      ),
                    ),
                    const SizedBox(width: 8,),
                    RichText(
                      text:TextSpan(
                          text: 'Live',style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: ' I For You',style: GoogleFonts.poppins(fontSize: 18,color: const Color(0xFFC9C4E0)))
                          ]),
                    ),
                    const Spacer()
                  ],
                ),
              ),
              ///BottomBar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80),
                    )
                  ),
                  height: size.height / 6.34,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/icons/pre.png')
                          )
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/icons/play.png'))
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/icons/next.png'))
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ///right bar
              Positioned(
                top: 0,
                bottom: 0,
                right: 16,
                child: Column(
                  children: [
                    const Spacer(),
                    ActionBtn(
                        iconPath: 'assets/icons/heart.svg',
                        title: '346',
                        onTap: (){}
                    ),
                    const SizedBox(height: 32,),
                    ActionBtn(
                        iconPath: 'assets/icons/comment.svg',
                        title: '65',
                        onTap: (){}
                    ),
                    const SizedBox(height: 32,),
                    ActionBtn(
                        iconPath: 'assets/icons/share.svg',
                        title: 'Share',
                        onTap: (){}
                    ),
                    const Spacer(),
                  ],
                ),
              )

            ],
          ),
        ),
        ),
    );
  }
}

class ActionBtn extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function() onTap;
  const ActionBtn({
    Key? key, required this.iconPath, required this.title, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.36)
            ),
            width: 60,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(iconPath),
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Text(title,style: GoogleFonts.poppins(fontSize: 12,color: Colors.white),)
      ],
    );
  }
}
