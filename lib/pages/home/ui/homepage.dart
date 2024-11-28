import 'package:ecommerce_app/components/homeBody.dart';
import 'package:ecommerce_app/pages/home/ui/components/categoryRow.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItem = 0;

  // getting seleceted value from category row
  void handleSelectingIndex(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  // returning widget based on selected index
  Widget returningWidget() {
    switch (selectedItem) {
      case 0:
        return HomeBody();
      case 1:
        return Text("Category 2");
      case 2:
        return Text("Category 3");
      case 3:
        return Text("Category 4");
      default:
        return Text("Null widget");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Background Color
        backgroundColor: Colors.white,

        // Body
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Name
              Text(
                "Hello Michael",
                style: AppStyles.headline,
              ),

              //  Categories List
              CategoryRow(
                onSelected: (value) => handleSelectingIndex(value),
              ),
              // Advertistment

              // body part
              Expanded(flex: 1, child: Container(child: returningWidget())),

              // Products

              // App Bar
            ],
          ),
        ),
      ),
    );
  }
}
