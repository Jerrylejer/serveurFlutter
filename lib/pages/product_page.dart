import 'package:flutter/material.dart';
import 'package:flutter_api/components/productLister.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Barre d'applications (AppBar)
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.45),
            title: const Text(
              'Nos produits',
              // Aggrandissement de l'appBAR !!!
            )),
        body: const Flexible(child: ProductLister()));
  }
}
