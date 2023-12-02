import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/pages/register.dart';
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
  @override
  Widget build(BuildContext context) {
    // Acceder a productos en la tienda
    final products = context.watch<Shop>().shop;
    // Pagina seleccionada, por default es el Home
    int selected = 0;
    // Controlador de vistas de pagina
    PageController pageController = PageController();

    /*@override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }*/

    return Scaffold(
      // Las difrentes vistas de paginas se controlan mediante PageView
      body: PageView(controller: pageController, children: [
        Center(child: Home(products: products)),
        const Center(child: Login()),
        const Center(child: Register())
      ]),
      //Barra inferior
      bottomNavigationBar: StylishBottomBar(
        items: bottomBarItems,
        option: AnimatedBarOptions(
            barAnimation: BarAnimation.fade, iconStyle: IconStyle.animated),
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
    icon: const Icon(Icons.home),
    selectedIcon: const Icon(Icons.home_filled),
    unSelectedColor: Colors.black,
    selectedColor: Colors.red,
    title: const Text('Home'),
  ),
  BottomBarItem(
    icon: const Icon(Icons.shopping_basket_outlined),
    selectedIcon: const Icon(Icons.shopping_basket),
    unSelectedColor: Colors.black,
    selectedColor: Colors.red,
    title: const Text('Cart'),
    badge: const Text('9+'), //Numero de elementos en carrito
    showBadge: true, //Mostrar punto de alerta
  ),
  BottomBarItem(
      icon: const Icon(Icons.person_outline),
      selectedIcon: const Icon(Icons.person),
      unSelectedColor: Colors.black,
      selectedColor: Colors.red,
      title: const Text('Profile'))
];
