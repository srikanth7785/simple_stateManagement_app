import 'package:flutter/material.dart';
import 'package:simple_app/Screens/checkout_screen.dart';
import 'package:simple_app/businessLogic/cart_manager.dart';
import 'package:simple_app/customWidgets/toast.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return ValueListenableBuilder(
      valueListenable: CartCollection(),
      builder: (context, values, child) {
        List<CartItem> items = values as List<CartItem>;
        return GestureDetector(
          // splashColor: Colors.deepPurple,
          onTap: () {
            if (items.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutScreen()),
              );
            }else{
              ScaffoldMessenger.of(context).showSnackBar(toast(context: context, text: 'No items in the cart'));
            }
          },
          child: Stack(
            children: [
              child!,
              Positioned(
                top: 2,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    items.length.toString(),
                    style: _textTheme.caption!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: const [
            Icon(
              Icons.shopping_cart_checkout_rounded,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
