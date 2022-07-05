import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Container(
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
              "3",
              textAlign: TextAlign.center,
              style: _textTheme.caption!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
