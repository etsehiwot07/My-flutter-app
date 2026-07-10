import 'package:flutter/material.dart';
import 'package:perfume_shop/constants.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/m_bground.jpg'),
            fit: BoxFit.cover,
          )
        ) ,
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("🍀 Perfume Shop",style:constant.perfume_text),
              const SizedBox(height:6),
              Text("Discover your signature scent.",style: TextStyle(fontSize:23),),
              const SizedBox(height:33),
              ElevatedButton(
                  onPressed:() {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black
                ),
                  child:Text("Get Started",style: constant.e_button,) ,
              )

            ],
          ),
        ),
      ),
    );
  }
}
