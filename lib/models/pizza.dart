import 'option_item.dart';

class Pizza{
  final int id;
  final String title;
  final String garniture;
  final String image;
  final double price;

  //Sélection de l'utilisateur
  int pate = 0;
  int taille = 1;
  int sauce = 0;

  //Options possibles
  static final List<OptionItem> pates = [
    OptionItem(0, 'Fine'),
    OptionItem(1, 'Epaisse'),
  ];
  static final List<OptionItem> tailles = [
    OptionItem(0, 'Petite', supplement: -1),
    OptionItem(1, 'Moyenne'),
    OptionItem(2, 'Grande', supplement: 2),
    OptionItem(3, 'Vraiment très très grande', supplement: 4),
  ];
  static final List<OptionItem> sauces = [
    OptionItem(0, 'Tomate'),
    OptionItem(1, 'Crème'),
    OptionItem(2, 'Barbecue'),
    OptionItem(3, 'Samourai'),
  ];

  Pizza(this.id, this.title, this.garniture, this.image, this.price);
  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        garniture = json['garniture'],
        image = json['image'].replaceAll('localhost', '10.0.2.2'),
        price = json['price'];

  double get total {
    double total = price;
    total += tailles[taille].supplement;
    total += sauces[sauce].supplement;
    total += pates[pate].supplement;
    return total;
  }
}