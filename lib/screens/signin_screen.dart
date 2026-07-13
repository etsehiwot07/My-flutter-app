import 'package:flutter/material.dart';

class signin extends StatelessWidget {
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.green,
        title:Text("Sign in"),
      ),
      body: Center(
        child: Text("Sign in Screen"),
      ),
    );
  }
}
