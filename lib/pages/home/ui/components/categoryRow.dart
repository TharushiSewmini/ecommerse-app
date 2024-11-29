import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryRow extends StatefulWidget {
  final Function(int) onSelected;
  CategoryRow({super.key, required this.onSelected});

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

// initial selected index

class _CategoryRowState extends State<CategoryRow> {
  int selectedIndex = 0;

// category List
  List<CategoryProps> categories = [
    CategoryProps(categoryName: "All", index: 0),
    CategoryProps(categoryName: "Electronics", index: 1),
    CategoryProps(categoryName: " Jewelery", index: 2),
    CategoryProps(categoryName: "Women's clothing", index: 3)
  ];

  void handlestateChange(int number) {
    widget.onSelected(number);
    setState(() {
      selectedIndex = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: 34,
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () => handlestateChange(categories[index].index),
                child: Container(
                  margin: EdgeInsets.only(right: 32),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 1),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: selectedIndex == categories[index].index
                          ? Colors.black
                          : Colors.transparent,
                      width: 3,
                    ))),
                    child: Text(
                      categories[index].categoryName,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: selectedIndex == categories[index].index
                            ? Colors.black
                            : Color(0xff868D94),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}

class CategoryProps {
  String categoryName;
  int index;
  CategoryProps({required this.categoryName, required this.index});
}
