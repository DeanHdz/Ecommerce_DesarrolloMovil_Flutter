import 'package:ecommerce/models/product.dart';

// La idea en specified location es poner la direccion, la clase de Order esta sujeto a cambios dependiendo de como queremos manejar el api de google

class Order {
  final int userId;
  final List<Product> products;
  final double totalPrice;
  final String specifiedLocation;

  Order(
      {required this.userId,
      required this.products,
      required this.totalPrice,
      required this.specifiedLocation});
}
