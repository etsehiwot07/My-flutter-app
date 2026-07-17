import 'package:flutter/material.dart';
import 'package:perfume_shop/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
      if (_pwdController.text != _confirmController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
  );
        return;
  }
      setState(() => _isLoading = true);

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _pwdController.text.trim(),
  );
        Navigator.pushReplacementNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Registration failed')),
  );
      }
      setState(() => _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: Color(0xFFA9E1AA),
        title: Text("Sign up",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.white),
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
                color: Color(0xFFA9E1AA),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child:const Text('🌸',style: TextStyle(fontSize:35),),
              ),
            ),
            SizedBox(height: 24,),
            Text("Create an Account",
              style: constant.createaccount,
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                fillColor: Colors.white,
                filled: true
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
                fillColor: Colors.white,
                filled: true,
              ),
              obscureText: true,
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _confirmController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline_sharp),
                fillColor: Colors.white,
                filled: true
              ),
              obscureText: true,
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA9E1AA),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                ? const CircularProgressIndicator(color: Colors.white,)
                : Text("Sign up",style: TextStyle(color: Colors.black),),
              ),
            ),
            SizedBox(height: 15,),
            TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/signin');
                }, child: Text("Already have an account? Sign In",style: TextStyle(color: Color(0xFF2E7D32)),)
            ),
          ],
        ),
      ),
    );
  }
}
