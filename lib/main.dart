import 'package:flutter/material.dart';
import 'package:perfume_shop/screens/mainscreen.dart';
import 'package:perfume_shop/screens/second_screen.dart';
import 'package:perfume_shop/theme.dart';
import 'package:provider/provider.dart';
import 'package:perfume_shop/cart_provider.dart';
import 'package:perfume_shop/screens/cart_page.dart';
import 'package:perfume_shop/screens/profile_page.dart';
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: perfume(),
  ),
  );
}

class perfume extends StatelessWidget {
  const perfume({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Raleway',
          ),),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Raleway',
        ),
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) =>mainscreen(),
        '/categories': (context) => secondscreen(),
        '/cart': (context) => CartScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}



