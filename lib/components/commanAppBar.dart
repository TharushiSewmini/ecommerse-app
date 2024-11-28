import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class CommanAppBar extends StatelessWidget {
  String title;
   CommanAppBar({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.largeLight20,
      ),
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
    );
  }
}
