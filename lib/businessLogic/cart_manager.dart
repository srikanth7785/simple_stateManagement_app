import 'package:flutter/cupertino.dart';

class CartItem{
  final int index;

  CartItem({required this.index});
}

class CartCollection extends ValueNotifier<List<CartItem>> {
  CartCollection._singleInstance() : super([]);

  static final CartCollection _single = CartCollection._singleInstance();

  factory CartCollection() => _single;

  int get count => value.length;

  void addToCart({required CartItem cartItem}) {
    value.add(cartItem);
    notifyListeners();
  }

  void removeFromCart({required CartItem cartItem}) {
      value.removeWhere((element) => element.index == cartItem.index);
      notifyListeners();
  }

  bool checkIfExists({required CartItem cartItem}){
    for(var item in value){
      if(item.index == cartItem.index) {
        return true;
      }
    }
    return false;
    // return value.contains(cartItem);
  }

}
