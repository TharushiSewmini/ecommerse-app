import 'package:ecommerce_app/pages/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculationRow extends StatefulWidget {
  int productId;
  String quantity;
  CalculationRow({super.key, required this.quantity , required this.productId});

  @override
  State<CalculationRow> createState() => _CalculationRowState();
}

class _CalculationRowState extends State<CalculationRow> {
  int totalItem = 0;

  @override
  Widget build(BuildContext context) {
    // increasing price
    void increasingPrice() {
      BlocProvider.of<CartBloc>(context)
          .add(IncreaseQuantityButtonClickedEvent(widget.productId));
    }

    // decreasing price
    void decreasingPrice() {
      BlocProvider.of<CartBloc>(context)
          .add(DecreaseQuantityButtonClickedEvent(widget.productId));
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
          widget.quantity,
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
