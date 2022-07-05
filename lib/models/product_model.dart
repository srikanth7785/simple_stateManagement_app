import 'package:simple_app/constants/product_info_params.dart';

typedef Params = ProductInfoParams;

class Product {
  final String title;
  final String subtitle;
  final String originalPrice;
  final String currentPrice;
  final String rating;
  final String ratingCount;
  final String imagePath;
  final List<String> colors;

  Product({
    required this.title,
    required this.subtitle,
    required this.originalPrice,
    required this.currentPrice,
    required this.rating,
    required this.ratingCount,
    required this.imagePath,
    required this.colors,
  });

  factory Product.fromInfo(Map<String, String> info, List<String> colors) {
    return Product(
      title: info[Params.TITLE] ?? '',
      subtitle: info[Params.SUB_TITLE] ?? '',
      originalPrice: info[Params.ORIGINAL_PRICE] ?? '',
      currentPrice: info[Params.CURRENT_PRICE] ?? '',
      rating: info[Params.RATING] ?? '',
      ratingCount: info[Params.RATING_COUNT] ?? '',
      imagePath: info[Params.IMAGE_PATH] ?? '',
      colors: colors,
    );
  }
}
