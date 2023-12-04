import 'package:ecommerce/models/producto.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:ecommerce/models/shop.dart';

class PageControl extends StatefulWidget {
  const PageControl({
    super.key,
  });

  @override
  State<PageControl> createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {
  //Pagina seleccionada, por default es 1 (Home) en initState
  late dynamic selected;
  //Controlador de vistas de pagina
  late PageController pageController;
  //Mostrar productos en el carrito
  late List<Product> cart = context.watch<Shop>().cart;
  //Mostrar productos de la tienda
  late List<Product> products = context.watch<Shop>().shop;
  //Obtener usuario
  late User user = context.watch<Shop>().user;

  @override
  void initState() {
    super.initState();
    pageController = PageController(); // Initialize pageController in initState
    selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    List<BottomBarItem> bottomBarItems = [
      BottomBarItem(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        unSelectedColor: Colors.black,
        selectedColor: Colors.red,
        title: const Text('Inicio'),
      ),
      BottomBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        selectedIcon: const Icon(Icons.shopping_cart),
        unSelectedColor: Colors.black,
        selectedColor: Colors.red,
        title: const Text('Carrito'),
        badge: Text(cart.length.toString()), //Numero de elementos en carrito
        showBadge: cart.isNotEmpty ? true : false, //Mostrar punto de alerta
      ),
      BottomBarItem(
          icon: const Icon(Icons.person_outline),
          selectedIcon: const Icon(Icons.person),
          unSelectedColor: Colors.black,
          selectedColor: Colors.red,
          title: const Text('Perfil'))
    ];

    /*@override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }*/

    return Scaffold(
      // Las difrentes vistas de paginas se controlan mediante PageView
      body: PageView(controller: pageController, children: [
        Center(child: HomePage(products: products, user: user)),
        const Center(child: CartPage()),
        const Center(child: ProfilePage())
      ]),
      //Barra inferior
      bottomNavigationBar: StylishBottomBar(
        items: bottomBarItems,
        option: AnimatedBarOptions(
            barAnimation: BarAnimation.fade, iconStyle: IconStyle.Default),
        currentIndex: selected,
        onTap: (index) {
          // si no se ha definido un usuario, redirigir a login
          if (user.id == null) {
            // Redirect to LoginPage
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          } else {
            //Si ya ha iniciado sesión lo redirige de acuerdo al bottomNavBar
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }
        },
      ),
    );
  }
}
