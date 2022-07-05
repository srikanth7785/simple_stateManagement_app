import 'package:flutter/material.dart';
import 'package:simple_app/dummyData/info.dart';
import 'package:simple_app/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final bool isAdded;
  final void Function(int) onAddOrRemove;
  const ProductCard({
    Key? key,
    required this.index,
    required this.isAdded,
    required this.onAddOrRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Product product =
        Product.fromInfo(ProductInfo.INFO, ProductInfo.COLORS);
    List<Color> _watchColors =
        product.colors.map((color) => Color(int.parse(color))).toList();
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            height: 90,
            width: 80,
            child: Image.asset(product.imagePath),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.title} #$index",
                    style: _textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(product.subtitle, style: _textTheme.bodyMedium!),
                  FittedBox(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 2,
                      ),
                      margin: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Colors:",
                            style: _textTheme.labelLarge,
                          ),
                          Stack(
                            children: [
                              for (int i = 0; i < _watchColors.length; i++)
                                Container(
                                  margin: EdgeInsets.only(left: i * 10),
                                  decoration: BoxDecoration(
                                    color: _watchColors[i],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  width: 20,
                                  height: 20,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\u20B9 ${product.currentPrice}",
                        style: _textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        product.originalPrice,
                        style: _textTheme.labelMedium!.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(2),
                child: Text(
                  "${product.rating}⭐(${product.ratingCount})",
                  style: _textTheme.bodySmall!.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: isAdded
                      ? const Icon(
                          Icons.check_rounded,
                          color: Colors.deepPurple,
                        )
                      : const Icon(Icons.add_shopping_cart),
                  onPressed: () => onAddOrRemove(index),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
