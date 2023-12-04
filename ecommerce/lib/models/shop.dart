import 'package:flutter/material.dart';
import 'product.dart';
import 'user.dart';

//Cualquier cambio que hagamos (agregar/borrar de carrito) notificamos a los listeners
//Significa que actualizamos el UI para los componentes que estan atentos a los cambios
class Shop extends ChangeNotifier {
  // Productos a la venta
  final List<Product> _shop = [
    // (Dean) lista de productos, reemplazar con fetch de firebase
    Product(
        name: "Product 1",
        price: 99.99,
        description:
            "Item description... lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
        image: 'headphones.png'),
    Product(
        name: "Product 2",
        price: 199.99,
        description: "Item description...",
        image: 'keyboard.jpg'),
    Product(
        name: "Product 3",
        price: 299.99,
        description: "Item description...",
        image: 'mic.jpg'),
    Product(
        name: "Product 4",
        price: 399.99,
        description: "Item description...",
        image: 'pc.jpg')
  ];

  // Carrito de usuario
  final List<Product> _cart = [];

  // Usuario
  User _user = User(
      id: 1,
      name: "Dean Joshua Hernandez",
      password: "pass1234"); //Iniciado sesion
  //User _user = User(id: null, name: null, password: null); //Vista de invitado

  // Get product list
  List<Product> get shop => _shop;

  // Get user cart
  List<Product> get cart => _cart;

  // Get user
  User get user => _user;

  //Cerrar sesión y dejar cuenta de invitado
  void setGuestUser() {
    _user = User(id: null, name: null, password: null);
    notifyListeners();
  }

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
