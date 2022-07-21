class Product {
  String? title, image, description, category;
  double? price;
  // double? id;
  Product(
      {this.title, this.description, this.image, this.price, this.category});
  factory Product.fromjson(Map<String, dynamic> data) {
    return Product(
        title: data['title'],
        // price: data['price'],
        category: data['category'],
        image: data['image'],
        description: data['description']);
  }
}
