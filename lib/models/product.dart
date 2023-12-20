class Product {
  // Constructor
  Product(this.name, this.description, this.price, this.image);

  final String name;
  final String description;
  final int price;
  final String image;

  // Permet de fabriquer des objets de type "Product"
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['name'], json['description'], json['price'], json['image']);
  }

  // Les getters (si besoin)
  String get getName => name;
  String get getDescription => description;
  int get getPrice => price;
  String get getImage => image;
}

class ProductList {
  // Constructor
  ProductList({required this.products});

  final List<Product> products;

  factory ProductList.fromJson(List<dynamic> parseJson) {
    List<Product> products = <Product>[];

    products = parseJson.map((product) => Product.fromJson(product)).toList();

    return ProductList(products: products);
  }
}
