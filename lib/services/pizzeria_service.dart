import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pizza.dart';

class PizzeriaService {
  static const String uri = 'http://10.0.2.2/api/pizzas';
  //Note : Sur emulateur Android, 10.0.2.2 est l'adresse de localhost (et non 127.0.0.1)

  Future<List<Pizza>> fetchPizzas() async {
    List<Pizza> pizzas = [];

    final response = await http.get(Uri.parse(uri));
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for (final values in json) {
          pizzas.add(Pizza.fromJson(values));
        }
      } else {
        throw Exception(
            'Impossible de récupérer les données.\nVérifier votre connexion Internet ou l\'état des serveurs de la pizzeria.');
      }
    }
    catch (e) {
      rethrow;
    }
    return pizzas;
  }
}