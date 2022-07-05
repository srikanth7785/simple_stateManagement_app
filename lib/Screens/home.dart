import 'package:flutter/material.dart';
import 'package:simple_app/customWidgets/checkout_button.dart';
import 'package:simple_app/customWidgets/product_card.dart';
import 'package:simple_app/dummyData/info.dart';
import 'package:simple_app/models/product_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Product product = Product.fromInfo(ProductInfo.INFO, ProductInfo.COLORS);

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
              "Continue you shopping!",
              style: _textTheme.bodySmall!
                  .copyWith(color: Colors.white70, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        actions: const [CheckoutButton()],
      ),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(index: index, product: product, isAdded: false);
        },
      ),
    );
  }
}
