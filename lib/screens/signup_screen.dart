import 'package:flutter/material.dart';
import 'package:perfume_shop/constants.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Sign up"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create an Account",
              style: constant.createaccount,
            ),
            const SizedBox(height: 15,),
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
            SizedBox(height: 15,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline_sharp),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Sign up")
              ),
            ),
            SizedBox(height: 15,),
            TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/signin');
                }, child: Text("Already have an account? Sign In")
            ),
          ],
        ),
      ),
    );
  }
}
