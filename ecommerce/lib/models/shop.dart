import 'package:flutter/material.dart';
import 'product.dart';

//Cualquier cambio que hagamos (agregar/borrar de carrito) notificamos a los listeners
//Significa que actualizamos el UI para los componentes que estan atentos a los cambios
class Shop extends ChangeNotifier {
  // Productos a la venta
  final List<Product> _shop = [
    // product 1
    Product(
      name: "Product 1",
      price: 99.99,
      description:
          "Item description... lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
      //imagePath: imagePath
    ),
    Product(
      name: "Product 2",
      price: 199.99,
      description: "Item description...",
      //imagePath: imagePath
    ),
    Product(
      name: "Product 3",
      price: 299.99,
      description: "Item description...",
      //imagePath: imagePath
    ),
    Product(
      name: "Product 4",
      price: 399.99,
      description: "Item description...",
      //imagePath: imagePath
    )
  ];

  // Carrito de usuario
  List<Product> _cart = [];

  // Get product list
  List<Product> get shop => _shop;

  // Get user cart
  List<Product> get cart => _cart;

  // Add item to cart
  void addToCart(Product item) {
    _cart.add(item);
  }

  // Remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
  }
}
