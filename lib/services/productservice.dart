import 'dart:convert';

import 'package:flutter_api/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  // Pour le navigateur
  static String productUrl = "http://localhost:8000/products.json";
  // pour l'émulateur
  // static String ProductUrl = "http://10.0.2.2:8000/products.json";
  // "Future" correspond aux "Observable" utilisés dans les appels http dans Angular
  static Future<ProductList?> getProducts() async {
    try {
      final response = await http
          .get(Uri.parse(productUrl), headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final jsonResponse = json.decode(response.body);
          final ProductList products = ProductList.fromJson(jsonResponse);
          if (products.products.isNotEmpty) {
            return products;
          } else {
            return null;
          }
        } else {
          return null;
        }
      } else {
        throw Exception("impossible de charger les produits");
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Erreur dans le chargement de la liste de produits');
    }
  }
}
