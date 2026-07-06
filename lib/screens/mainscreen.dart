import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/constants.dart';
import 'package:provider/provider.dart';
import 'package:perfume_shop/theme.dart';
import 'package:perfume_shop/l10n/string.dart';


class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  bool isDarkMode = false;
  String selectedLanguage = 'English';
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<ThemeProvider>(context).selectedLanguage;
    return SafeArea(
        top: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Color(0xFFF6F1E9),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFA3B18A),
                ),
                child: Text(
                  AppStrings.menu(lang),
                  style: TextStyle(color:constant.text2Color(context), fontSize: 24),
                ),
              ),


              SwitchListTile(
                title: Text(AppStrings.darkMode(lang)),
                secondary: Icon(Icons.dark_mode),
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (val) {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme(val);
                },
              ),

              ListTile(
                leading: Icon(Icons.translate),
                title: Text(AppStrings.language(lang)),
                trailing: DropdownButton<String>(
                  value: Provider.of<ThemeProvider>(context).selectedLanguage,
                  items: ['English', 'Amharic', 'Turkish'].map((lang) {
                    return DropdownMenuItem(value: lang, child: Text(lang));
                  }).toList(),
                  onChanged: (val) {
                    Provider.of<ThemeProvider>(context, listen: false).changeLanguage(val!);
                  },
                ),
              ),

              ListTile(
                leading: Icon(Icons.logout, color: Color(0xFFA3B18A),),
                title: Text(AppStrings.logOut(lang)),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.88,
              child: Stack(
                children: [
                  Positioned(
                      top: 400,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color:Color(0xFFA3B18A),
                          borderRadius:BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)
                          )
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 202, 40, 7),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(AppStrings.aqua(lang),style:TextStyle(color:constant.text2Color(context),fontSize: 20,fontFamily:'PlayfairDisplay' ),),
                                  SizedBox(height: 7),
                                  Text(AppStrings.description(lang),style:TextStyle(color:constant.text2Color(context),fontSize: 12,fontFamily: 'Raleway',),textAlign: TextAlign.center,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CupertinoIcons.money_pound,color:constant.text2Color(context),size: 25,fontWeight: FontWeight.bold,),
                                      Text(" 70.00",style:TextStyle( color:constant.text2Color(context),fontSize: 25,
                                        fontWeight: FontWeight.bold,fontFamily:'CormorantGaramond',),),
                                    ],
                                  ),
                                ],
                              ),
                          ),
                        ),
                      )
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[900]
                            : Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/images/sage2.jpg'),
                            fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),

                        )
                    ),
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    height: 600,
                    child:Column(
                      children: [
                        Text(AppStrings.aqua(lang),style:TextStyle(color:constant.textColor(context),fontSize: 35,
                          fontWeight: FontWeight.bold,fontFamily:'CormorantGaramond'),),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 350,
                            child:
                        PageView(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            children:[
                              Image.asset("assets/images/pe7.jpg",width: 130,height: 150,fit: BoxFit.scaleDown,
                                alignment: Alignment.center,),
                              Image.asset("assets/images/pe8.jpg",width: 150,height: 150,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.center,),
                              Image.asset("assets/images/pe12.jpg",width: 150,height: 150,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.center,),
                            ]
                        )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 21),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: _currentPage == index ? 12 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: _currentPage == index
                                      ? Color(0xFFA3B18A)
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              );
                            }),
                          ),
                        )
                      ],
                    ) ,
                  ),
                  Positioned(
                    top: 40,
                    right: 10,
                    width: 50,
                    height: 50,
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:10,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/categories');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.cart_fill_badge_plus,size: 35,color: Color(0xFFA3B18A),),
                  SizedBox(width: 7,),
                  Text(AppStrings.addToBasket(lang),style: constant.basket,)
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}