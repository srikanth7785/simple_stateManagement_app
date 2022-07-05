// ignore_for_file: constant_identifier_names

import 'package:simple_app/constants/product_info_params.dart';

typedef Params = ProductInfoParams;

class ProductInfo {
  static const Map<String, String> INFO = {
    Params.TITLE: 'Unique Santa Collection',
    Params.SUB_TITLE: 'Analog wrist watch',
    Params.ORIGINAL_PRICE: '999',
    Params.CURRENT_PRICE: '499',
    Params.RATING: '4.3',
    Params.RATING_COUNT: '2789',
    Params.IMAGE_PATH: 'assets/purple_watch_1.png',
  };
  static const List<String> COLORS = [
    '0xFFFFC107',
    '0xFF4CAF50',
    '0xFF673AB7',
  ];
}
