import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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