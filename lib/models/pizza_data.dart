import 'package:pizzeria/models/pizza.dart';

class PizzaData{
  static List<Pizza> buildList() {
    List<Pizza> list = [];
    list.add(Pizza(1, "Barbecue", "Pâte fine, sauce barbecue, fromage, jambon", "pizza-bbq.jpg", 8));
    list.add(Pizza(2, "Hawai", "Pâte fine, sauce tomate, jambon, fromage, tranches d'ananas", "pizza-hawai.jpg", 9));
    list.add(Pizza(3, "Epinards", "Pâte fine, sauce tomate, fromage, épinards en tranche", "pizza-spinach.jpg", 7));
    list.add(Pizza(4, "Végétarienne", "Pâte fine, sauce tomate, fromage, tomate, poivrons, oignons, olives", "pizza-vegetable.jpg", 10));
    return list;
  }
}