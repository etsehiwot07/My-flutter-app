import 'package:flutter/material.dart';
import 'package:perfume_shop/screens/mainscreen.dart';
import 'package:perfume_shop/screens/second_screen.dart';
import 'package:perfume_shop/screens/signin_screen.dart';
import 'package:perfume_shop/screens/signup_screen.dart';
import 'package:perfume_shop/theme.dart';
import 'package:provider/provider.dart';
import 'package:perfume_shop/cart_provider.dart';
import 'package:perfume_shop/screens/cart_page.dart';
import 'package:perfume_shop/screens/profile_page.dart';
import 'package:perfume_shop/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/': (context) => SplashScreen(),
        '/main':(context) => mainscreen(),
        '/signin':(context) => signin(),
        '/signup':(context) => signup(),
        '/categories': (context) => secondscreen(),
        '/cart': (context) => CartScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}



