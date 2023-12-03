import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:ecommerce/models/shop.dart';

class PageControl extends StatefulWidget {
  const PageControl({
    Key? key,
  }) : super(key: key);

  @override
  State<PageControl> createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {
  late dynamic selected = 0; // Declare as late to avoid null safety warnings
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    selected = 0; // Initialize selected in initState
    pageController = PageController(); // Initialize pageController in initState
  }

  @override
  Widget build(BuildContext context) {
    // Acceder a productos en la tienda
    final products = context.watch<Shop>().shop;

    /*@override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }*/

    return Scaffold(
      // Las difrentes vistas de paginas se controlan mediante PageView
      body: PageView(controller: pageController, children: [
        Center(child: HomePage(products: products)),
        const Center(child: CartPage()),
        const Center(child: LoginPage())
      ]),
      //Barra inferior
      bottomNavigationBar: StylishBottomBar(
        items: bottomBarItems,
        option: AnimatedBarOptions(
            barAnimation: BarAnimation.fade, iconStyle: IconStyle.Default),
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}

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
    badge: const Text('9+'), //Numero de elementos en carrito
    showBadge: true, //Mostrar punto de alerta
  ),
  BottomBarItem(
      icon: const Icon(Icons.person_outline),
      selectedIcon: const Icon(Icons.person),
      unSelectedColor: Colors.black,
      selectedColor: Colors.red,
      title: const Text('Perfil'))
];
