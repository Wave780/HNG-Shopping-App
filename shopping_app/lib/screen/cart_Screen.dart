// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/screen/order_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Product> checkoutProduct;
  final void Function(Product) removeProduct;
  final VoidCallback orderSuccess;
  const CartScreen(
      {super.key,
      required this.checkoutProduct,
      required this.removeProduct,
      required this.orderSuccess});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isShowingLoadingDialog = false;
   
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.checkoutProduct.isEmpty
            ? Expanded(
                child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("image/image 13.png"),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Empty Cart',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ))
            : Expanded(
                child: ListView.builder(
                    itemCount: widget.checkoutProduct.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        subtitle: Text(widget.checkoutProduct[index].name),
                        leading:
                            Image(image: widget.checkoutProduct[index].image),
                        trailing: IconButton(
                          icon: const Icon(Icons.payment_sharp),
                          onPressed: () async {
                            if (!isShowingLoadingDialog) {
                              setState(() {
                                isShowingLoadingDialog = true;
                              });

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });

                              await Future.delayed(const Duration(seconds: 2));

                              widget
                                  .removeProduct(widget.checkoutProduct[index]);

                              Navigator.pop(context);
                              setState(() {
                                isShowingLoadingDialog = false;
                              });
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const OrderScreen();
                              }));
                            }
                          },
                        ),
                      );
                    }))
      ],
    );
  }
}
// IconButton(
//                           icon: const Icon(Icons.remove_circle),
//                           onPressed: () {
//                             widget.removeProduct(widget.checkoutProduct[index]);
//                           },
//                         ),