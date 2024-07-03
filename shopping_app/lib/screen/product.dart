import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/widget/product_item.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
        id: '1',
        name: 'Coco',
        cost: 12000.00,
        image: const AssetImage(
            "image/American-Garden-Mayonnaise-Eggless-473ml 2.png")),
    Product(
        id: '2',
        name: 'Egg Noodles',
        cost: 1000.00,
        image: const AssetImage('image/egg-noodle (1) 2.png')),
    Product(
        id: '3',
        name: 'Potato Chips',
        cost: 800.00,
        image: const AssetImage('image/Group 6848.png')),
    Product(
        id: '4',
        name: 'Coke',
        cost: 1200.00,
        image: const AssetImage('image/pngfuel 11.png')),
    Product(
        id: '5',
        name: 'Sprite',
        cost: 12000.00,
        image: const AssetImage('image/pngfuel 12.png')),
    Product(
        id: '6',
        name: 'Egg',
        cost: 8200.00,
        image: const AssetImage('image/pngfuel 18.png')),
    Product(
        id: '7',
        name: 'Crackers',
        cost: 1200.00,
        image: const AssetImage('image/rp_24790392_0053554627_l 2.png')),
    Product(
        id: '8',
        name: 'Oil',
        cost: 12000.00,
        image: const AssetImage('image/tree-top-juice-apple-grape-64oz 1.png')),
  ];

  final void Function(Product) onAddProduct;
  ProductScreen({super.key, required this.onAddProduct});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            product: products[index],
            onAddProduct: onAddProduct,
          );
        },
      ),
    );
  }
}
