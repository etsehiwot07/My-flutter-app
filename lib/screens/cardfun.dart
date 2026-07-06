import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/constants.dart';
import 'package:provider/provider.dart';
import 'package:perfume_shop/cart_provider.dart';


 card(BuildContext context,String a,String d, String t,String m){
   return Card(
     color:constant.text3Color(context),
     child: Column(
       children: [
         SizedBox(height: 20,),
         Text(a,style: constant.aqua3,),
         SizedBox(height: 30,),
         ClipRRect(
           borderRadius: BorderRadius.circular(50),
           child: Image.asset(
             d,
             width: 250,
             height: 150,
             fit: BoxFit.contain,
           ),
         ),
         SizedBox(height: 15,),
         Text(t,style: constant.bottomtxt,),
         SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     Icon(CupertinoIcons.money_pound,color: Colors.white,size: 25,),
                     Text(m,style: constant.aqua4,),
                   ],
                 ),
                 IconButton(
                   icon: Icon(CupertinoIcons.cart_badge_plus, color: Colors.white),
                   onPressed: () {
                     Provider.of<CartProvider>(context, listen: false).addItem(
                       CartItem(name: a, image: d, subtitle: t, price: m),
                     );
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                         content: Text('$a added to cart!'),
                         backgroundColor: Color(0xFFA3B18A),
                         duration: Duration(seconds: 1),
                       ),
                     );
                   },
                 ),
               ],
             ),
       ],
     ),
   );
 }

card2(BuildContext context,String v,String x, String e,String price){
  return Card(
    color:constant.text4Color(context),
    child: Column(
      children: [
        SizedBox(height: 20,),
        Text(v,textAlign: TextAlign.center,style: TextStyle(color:
        Theme.of(context).brightness == Brightness.dark
            ? Color(0xFFF6F1E9)
            : Colors.black,fontFamily:'PlayfairDisplay'),),
        SizedBox(height:20,),
        Image.asset(
          x,
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 23,),
        Text(e,textAlign: TextAlign.center,style: TextStyle(color:
        Theme.of(context).brightness == Brightness.dark
            ? Color(0xFFF6F1E9)
            : Colors.black,fontFamily: 'Raleway'),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(CupertinoIcons.cart_badge_plus,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Color(0xFFA3B18A),
                size: 25,
              ),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addItem(
                  CartItem(name: v, image: x, subtitle: e, price: price),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$v added to cart!'),
                    backgroundColor: Color(0xFFA3B18A),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  );
}