import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryItem(selected: index==0 ? true : false,),
                ),
                itemCount: 20,
            ),
          )

        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool selected;
  const CategoryItem({
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.12,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFFCFAFE),
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 8,),
          Text('All',style: GoogleFonts.poppins(fontSize: 12,color: selected ? Colors.white : const Color(0xFF7F85A2)),)
        ],
      ),
    );
  }
}
