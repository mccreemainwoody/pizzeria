import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import '../ui/panier.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Cart _cart;

  const AppBarWidget(this.title, this._cart, {Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
                context, 
                MaterialPageRoute(
                    builder: (context) => Panier(_cart),
                )
            );
          },
        ),
      ],
    );
  }
}
