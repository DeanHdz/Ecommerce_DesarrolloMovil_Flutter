import 'package:ecommerce/models/product.dart';

// La idea en specified location es poner la direccion, la clase de Order esta sujeto a cambios dependiendo de como queremos manejar el api de google

class Order {
  final int user_id;
  final List<Product> products;
  final double total_price;
  final String specified_location;

  Order(
      {required this.user_id,
      required this.products,
      required this.total_price,
      required this.specified_location});
}
