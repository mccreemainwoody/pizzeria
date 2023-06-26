import 'package:flutter/material.dart';
import 'package:pizzeria/models/pizza.dart';
import 'package:pizzeria/models/cart.dart';

class BuyButtonWidget extends StatelessWidget {
  final Pizza _pizza;
  final Cart _cart;
  const BuyButtonWidget(this._pizza, this._cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade800),
          ),
          onPressed: () {
            print("Commander une pizza");
            _cart.addProduct(_pizza);
          },
          child: Row(
            children: const [
              Icon(Icons.shopping_cart),
              SizedBox(width: 5),
              Text("Commander"),
            ],
          ),
        ),
      ],
    );
  }
}
