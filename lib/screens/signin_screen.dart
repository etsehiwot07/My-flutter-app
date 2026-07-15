import 'package:flutter/material.dart';
import 'package:perfume_shop/constants.dart';

class signin extends StatelessWidget {
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("Sign In"),
          ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome back!",
              style: constant.createaccount,
            ),
            const SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Sign In"),
              ),
            ),
            SizedBox(height: 15,),
            TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/signup');
                }, child: Text("Don't have an account? Sign up")
            ),
          ],
        ),
      ),
      );
  }
}
