import 'package:flutter/material.dart';
import 'package:simple_app/businessLogic/cart_manager.dart';
import 'package:simple_app/customWidgets/checkout_button.dart';
import 'package:simple_app/customWidgets/product_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, John 👋",
              style: _textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            Text(
              "continue your shopping!",
              style: _textTheme.bodySmall!
                  .copyWith(color: Colors.white70, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        actions: const [CheckoutButton()],
      ),
      body: ValueListenableBuilder(
        valueListenable: CartCollection(),
        builder: (context, values, child) {
          final cart = CartCollection();
          return ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              CartItem cartItem = CartItem(index: index);
              bool isAdded = cart.checkIfExists(cartItem: cartItem);
              return ProductCard(
                index: index,
                isAdded: isAdded,
                onAddOrRemove: (i) {
                  if (isAdded) {
                    cart.removeFromCart(cartItem: cartItem);
                  } else {
                    cart.addToCart(cartItem: cartItem);
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
