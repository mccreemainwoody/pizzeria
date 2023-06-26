import 'package:pizzeria/models/pizza.dart';

class CartItem{
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart{
  final List<CartItem> _items = [];
  static const double _tva = 0.055;

  int totalItems(){
    return _items.length;
  }
  CartItem getCartItem(int index){
    return _items[index];
  }
  double getTotalPrice(){
    double total = 0;
    for (CartItem item in _items) {
      total += item.pizza.price * item.quantity;
    }
    return total;
  }
  double getTotalPriceTvaAddition(){
    return getTotalPrice() * _tva;
  }
  double getTotalPriceAfterTva(){
    return getTotalPrice() + getTotalPriceTvaAddition();
  }

  void addProduct(Pizza pizza){
    int index = findCartItemIndex(pizza.id);
    if(index == -1) {
      _items.add(CartItem(pizza));
    } else{
      CartItem item = _items[index];
      item.quantity++;
    }
  }

  void removeProduct(Pizza pizza){
    int index = findCartItemIndex(pizza.id);
    if (index != -1) _items.removeAt(index);
  }

  int findCartItemIndex(int id){
    return _items.indexWhere((item) => item.pizza.id == id);
  }
}