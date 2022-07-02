import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/category_item_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final bool selected;
  final CategoryItemModel item;
  final Function() onTap;
  const CategoryItemWidget({
    required this.selected,
    required this.item,
    Key? key, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(125),
            gradient: selected ? const LinearGradient(
                colors: [Color(0xFFFAB8C4),Color(0xFF5956E9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ) : null,
            color: selected ? null : const Color(0xFFF7F7F7)
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 27,
                backgroundColor: const Color(0xFFFCFAFE),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(item.iconPath),
                ),
              ),
            ),
            const Spacer(),
            Text(item.name,style: GoogleFonts.poppins(fontSize: 12,color: selected ? Colors.white : const Color(0xFF7F85A2)),),
            const SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }
}