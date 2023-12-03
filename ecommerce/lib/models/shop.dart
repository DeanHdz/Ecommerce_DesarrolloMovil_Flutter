import 'package:flutter/material.dart';
import 'product.dart';

//Cualquier cambio que hagamos (agregar/borrar de carrito) notificamos a los listeners
//Significa que actualizamos el UI para los componentes que estan atentos a los cambios
class Shop extends ChangeNotifier {
  // Productos a la venta
  List<Product> _shop = [
    // (Dean) lista de productos, reemplazar con fetch de firebase
    Product(
        name: "Product 1",
        price: 99.99,
        description:
            "Item description... lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
        imagePath: 'headphones.png'),
    Product(
        name: "Product 2",
        price: 199.99,
        description: "Item description...",
        imagePath: 'keyboard.jpg'),
    Product(
        name: "Product 3",
        price: 299.99,
        description: "Item description...",
        imagePath: 'mic.jpg'),
    Product(
        name: "Product 4",
        price: 399.99,
        description: "Item description...",
        imagePath: 'pc.jpg')
  ];

  // Carrito de usuario
  List<Product> _cart = [];

  // Get product list
  List<Product> get shop => _shop;

  // Get user cart
  List<Product> get cart => _cart;

  // Agregar producto a carrito
  void addToCart(Product item) {
    _cart.add(item);
    // Notificar listeners que el carrito se modifico (pageControl)
    notifyListeners();
  }

  // Remover producto de carrito
  void removeFromCart(Product item) {
    _cart.remove(item);
    // Notificar listeners que el carrito se modifico (cart_page)
    notifyListeners();
  }
}
