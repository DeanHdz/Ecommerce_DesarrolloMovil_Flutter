class Product {
  late final String? id;
  final String name;
  final String price;
  final String description;
  final String image;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Nombre': name,
      'Precio': price,
      'Descripcion': description,
      'Imagen': image
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['Nombre'],
      price: map['Precio'],
      description: map['Descripcion'],
      image: map['Imagen']
    );
  }
}
