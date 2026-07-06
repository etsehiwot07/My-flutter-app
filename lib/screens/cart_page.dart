import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:perfume_shop/theme.dart';
import 'package:perfume_shop/cart_provider.dart';
import 'package:perfume_shop/constants.dart';
import 'package:perfume_shop/l10n/string.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final lang = Provider.of<ThemeProvider>(context).selectedLanguage;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFA3B18A),
          title: Text(
            AppStrings.mycart(lang),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: cart.items.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 100,
                color: Color(0xFFA3B18A),
              ),
              SizedBox(height: 20),
              Text(
                'Your cart is empty',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
            : ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            final item = cart.items[index];
            return Card(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[800]
                  : Colors.white,
              margin: EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: Image.asset(
                  item.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
                title: Text(
                  item.name,
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  item.subtitle,
                  style: TextStyle(fontFamily: 'Raleway'),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '£${item.price}',
                      style: TextStyle(
                        fontFamily: 'CormorantGaramond',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA3B18A),
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Color(0xFFA3B18A)),
                      onPressed: () {
                        cart.removeItem(index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}