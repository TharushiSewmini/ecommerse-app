import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  String ButttonText;
  final Function() onClick;
  ReusableButton({super.key, required this.ButttonText, required this.onClick});

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
          backgroundColor: const WidgetStatePropertyAll(AppStyles.secondaryColor),
        ),
        onPressed: () {},
        child: Text(
          ButttonText,
          style: AppStyles.normalLightwhite,
        ),
      ),
    );
  }
}
