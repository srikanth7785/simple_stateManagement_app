import 'package:flutter/material.dart';
import 'package:simple_app/businessLogic/cart_manager.dart';
import 'package:simple_app/customWidgets/product_card.dart';
import 'package:simple_app/customWidgets/toast.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You are almost done 👋",
              style: _textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            Text(
              "just complete the payment!",
              style: _textTheme.bodySmall!
                  .copyWith(color: Colors.white70, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: CartCollection(),
        builder: (context, values, child) {
          List<CartItem> items = values as List<CartItem>;
          final cart = CartCollection();
          return items.isEmpty
              ? Center(
                  child: Text(
                    "No items in the cart",
                    style: _textTheme.titleLarge,
                  ),
                )
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      index: items[index].index,
                      isAdded: true,
                      onAddOrRemove: (i) {
                        cart.removeFromCart(cartItem: CartItem(index: i));
                      },
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        color: Colors.black12,
        child: ValueListenableBuilder(
            valueListenable: CartCollection(),
            builder: (context, values, child) {
              List<CartItem> items = values as List<CartItem>;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price: \u20B9${items.length * 499}",
                    style: _textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    onPressed: items.isEmpty
                        ? null
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              toast(
                                  context: context,
                                  text: 'Payment Successful!'),
                            );
                          },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(25)),
                    )),
                    child: const Text("Pay Now"),
                  )
                ],
              );
            }),
      ),
    );
  }
}

              // style: ButtonStyle(
              //     shape: MaterialStateProperty.all(
              //   RoundedRectangleBorder(
              //       borderRadius: BorderRadiusDirectional.circular(25)),
              // )),