import 'package:flutter/material.dart';
import 'package:perfume_shop/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signin() async{
    setState(() => _isLoading);

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _pwdController.text.trim(),
      );
      Navigator.pushReplacementNamed(context,'/main');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'sign in failed')),
      );
    }
    setState(() => _isLoading = false );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: Color(0xFFA9E1AA),
          title:
            Text("Sign In",style: TextStyle(color: Colors.black),),
            iconTheme:IconThemeData(color:Colors.white ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32,),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFA9E1AA),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Center(
                child: Text('🌸',style: TextStyle(fontSize: 35),),
              ),
            ),
            const SizedBox(height: 24,),
            Text(
              "Welcome back!",
              style: constant.createaccount,
            ),
            const SizedBox(height: 30,),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _pwdController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _signin,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA9E1AA),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white,)
                    : Text("Sign In",style: TextStyle(color: Colors.black),),
              ),
            ),
            SizedBox(height: 15,),
            TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/signup');
                }, child: Text("Don't have an account? Sign up",style: TextStyle(color: Color(0xFF2E7D32)),)
            ),
          ],
        ),
      ),
      );
  }
}
