import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  String placeHolderText;
  TextEditingController controller;
  bool isIconShow;
  ReusableTextField(
      {super.key,
      required this.controller,
      required this.placeHolderText,
      this.isIconShow = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.maxFinite,
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: isIconShow
                  ? Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                      size: 30,
                    )
                  : null,
              hintText: placeHolderText,
              hintStyle: AppStyles.normalLight,
              focusColor: Colors.grey.shade200,
              filled: true,
              fillColor: Colors.grey.shade200,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)))),
    );
  }
}
