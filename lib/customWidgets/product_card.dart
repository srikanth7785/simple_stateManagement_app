import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    List<Color> _watchColors = [Colors.deepPurple, Colors.green, Colors.black];
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
            child: Image.asset('assets/purple_watch_1.png'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Unique Santa Collection #$index",
                    style: _textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text("Analog wrist watch", style: _textTheme.bodyMedium!),
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
                              for (int i = 0; i < 3; i++)
                                Container(
                                  margin: EdgeInsets.only(left: i * 8),
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
                        "\u20B9 499",
                        style: _textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "999",
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
                  "4.3⭐(2789)",
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
                  icon: const Icon(Icons.add_shopping_cart,),
                  onPressed: () {
                    debugPrint("adding");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
