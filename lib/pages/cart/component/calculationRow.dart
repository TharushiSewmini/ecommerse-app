import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';

class CalculationRow extends StatefulWidget {
  const CalculationRow({super.key});

  @override
  State<CalculationRow> createState() => _CalculationRowState();
}

class _CalculationRowState extends State<CalculationRow> {
  int totalItem = 0;

  @override
  Widget build(BuildContext context) {
    // increasing price
    void increasingPrice() {
      setState(() {
        totalItem += 1;
      });
    }

    // decreasing price
    void decreasingPrice() {
      if (totalItem > 0) {
        setState(() {
          totalItem -= 1;
        });
      }
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.grey.shade100,
              elevation: 0,
              onPressed: () => decreasingPrice(),
              child: const Icon(Icons.remove),
            ),
          ),
        ),
        Text(
          totalItem.toString(),
          style: AppStyles.normal,
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: FittedBox(
            child: FloatingActionButton(
               heroTag: null,
              backgroundColor: const Color(0xff495057),
              elevation: 0,
              onPressed: () => increasingPrice(),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
