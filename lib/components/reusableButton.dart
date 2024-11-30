import 'dart:ffi';

import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  String ButttonText;
  final Function() onClick;
  bool isDisable;
  ReusableButton(
      {super.key,
      required this.ButttonText,
      required this.onClick,
      this.isDisable = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.maxFinite,
      child: ElevatedButton(
        
        style: ButtonStyle(
        
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(
              isDisable ? AppStyles.thirdColor : AppStyles.secondaryColor),
        ),
        onPressed: isDisable ? null : onClick,
        child: Text(
          ButttonText,
          style: isDisable ? AppStyles.normalLight : AppStyles.normalLightwhite,
        ),
      ),
    );
  }
}
