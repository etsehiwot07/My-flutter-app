import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  final String subtitle;
  final String price;

  CartItem({
    required this.name,
    required this.image,
    required this.subtitle,
    required this.price,
  });
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  int get itemCount => _items.length;
}