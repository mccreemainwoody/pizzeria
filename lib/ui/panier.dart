import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

/*
  * This is the stateful widget that the main application instantiates.
  * TAIS-TOI COPILOT JE VEUX JUSTE NOTER QU'IL FAUT SURTOUT QUE JE CONTINUE
  * CA POUR LA PROCHAINE FOIS
  * Ah et la page du tp c'est TP4, dernière page c:
 */

class Panier extends StatefulWidget {
  final Cart _cart;

  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            itemCount: widget._cart.totalItems(),
            itemBuilder: (context, index) {
              return _buildItem(widget._cart.getCartItem(index));
            },
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Table(
              children: [
                TableRow(children: [
                  Text('Total HT : ${widget._cart.getTotalPrice()} €', style: PizzeriaStyle.priceSubTotalTextStyle),
                ]),
                TableRow(children: [
                  Text('Total TVA : ${widget._cart.getTotalPriceTvaAddition()} €', style: PizzeriaStyle.priceSubTotalTextStyle),
                ]),
                TableRow(children: [
                  Text('Total : ${widget._cart.getTotalPriceAfterTva()} €', style: PizzeriaStyle.priceTotalTextStyle),
                ]),
              ],
            ),
          ),
          ElevatedButton(
            child: const Text('Allez hop'),
            onPressed: () {
              print("woaaah ataiension la pizza arrive");
              //Navigator.pushNamed(context, '/paiement');
            },
          )
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return Container(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              cartItem.pizza.image,
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.pizza.title,
                  style: PizzeriaStyle.baseTextStyle,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${cartItem.pizza.price}€'),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cartItem.quantity--;
                            if (cartItem.quantity <= 0) {
                              widget._cart.removeProduct(cartItem.pizza);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(15, 20),
                        ),
                        child: Text('-', style: PizzeriaStyle.baseTextStyle),
                      ),
                      Text('${cartItem.quantity}'),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cartItem.quantity++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size(15, 20),
                        ),
                        child: Text('+', style: PizzeriaStyle.baseTextStyle),
                      ),
                    ]),
                Text(
                  'Sous-total : ${cartItem.pizza.price * cartItem.quantity}€',
                  style: PizzeriaStyle.priceSubTotalTextStyle,
                ),
                //Text(cartItem.pizza.price.toString()),
              ],
            ),
          ],
        ));
  }
}
