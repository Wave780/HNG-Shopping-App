import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(
      {super.key, required this.product, required this.onAddProduct});
  final void Function(Product) onAddProduct;

  static const snackBar = SnackBar(content: Text('Checkout Cart'));
  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: product.image),
        Text(product.name),
        Text('\$${product.cost.toStringAsFixed(2)}'),
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              onAddProduct(product);
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.green,))
      ],
    ));
  }
}
