import 'package:flutter/material.dart';
import 'package:flutter_api/models/product.dart';
import 'package:flutter_api/services/productservice.dart';

class ProductLister extends StatefulWidget {
  const ProductLister({super.key});

  @override
  State<ProductLister> createState() => _ProductListerState();
}

class _ProductListerState extends State<ProductLister> {
  late Future<ProductList?> products;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
    setState(() {
      products = ProductService.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          // Les données sont arrivées sans erreur:
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!.products;
            return ListView.builder(
                itemCount: snapshot.data!.products.length,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      // You can customize Card properties here
                      child: ListTile(
                        leading: Image.asset(
                          "web/assets/img/${product.image}",
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.description),
                            Text('\$${product.price}'),
                          ],
                        ),
                        // You can handle onTap here
                        onTap: () {
                          // Add your onTap logic
                        },
                      ),
                    ),
                  );
                });
            // la requete a provoqué une erreur
          } else if (snapshot.hasError) {
            return Text("error: ${snapshot.error}");
          }
          return const Expanded(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}
