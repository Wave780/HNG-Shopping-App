import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/screen/cart_Screen.dart';
import 'package:shopping_app/screen/order_screen.dart';
import 'package:shopping_app/screen/product.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<App> {
  final List<Product> checkoutProduct = [];
  int selectedIndex = 0;

  void onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void addProduct(Product product) {
    setState(() {
      checkoutProduct.add(product);
    });
  }

  void removeProduct(Product product) {
    setState(() {
      checkoutProduct.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('HNG SHOP')),
        body: IndexedStack(
          index: selectedIndex,
          //alignment: AlignmentDirectional.topStart,
          children: [
            ProductScreen(
              onAddProduct: addProduct,
            ),
            CartScreen(
                checkoutProduct: checkoutProduct,
                removeProduct: removeProduct,
                orderSuccess: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const OrderScreen();
                  }));
                })
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_rounded),
              label: 'Cart',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onTapItem,
        ));
  }
}
