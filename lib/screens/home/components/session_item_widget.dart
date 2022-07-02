import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/session_model.dart';

class SessionItemWidget extends StatelessWidget {
  final SessionModel item;
  const SessionItemWidget({
    Key? key, required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        //todo : next page
      },
      child: SizedBox(
        width: size.width/2,
        child: Stack(
          children: [
            //image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage(item.imagePath),fit: BoxFit.cover),
              ),
            ),
            //background gradient
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.5)
                      ]
                  )
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
                      CircleAvatar(backgroundImage : AssetImage(item.userImgPath),radius: 12,),
                      const SizedBox(width: 8,),
                      Text(item.userName,style: GoogleFonts.prompt(fontSize: 9,color: Colors.white),),
                    ],
                  ),
                  Text(item.title,style: GoogleFonts.poppins(fontSize: 14,color: Colors.white),),
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
                  Text(item.view,style: GoogleFonts.poppins(fontSize: 10,color: Colors.white),)
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
      ),
    );
  }
}