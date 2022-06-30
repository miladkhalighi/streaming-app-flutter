import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app/models/category_item_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.17,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryItemWidget(
                    selected: index==0 ? true : false,
                    item: categoryItemsList[index],
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

class CategoryItemWidget extends StatelessWidget {
  final bool selected;
  final CategoryItemModel item;
  const CategoryItemWidget({
    required this.selected,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
              radius: size.width * 0.05,
              backgroundColor: const Color(0xFFFCFAFE),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(item.iconPath),
              ),
            ),
          ),
          const Spacer(),
          Text(item.name,style: GoogleFonts.poppins(fontSize: 12,color: selected ? Colors.white : const Color(0xFF7F85A2)),),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }
}
