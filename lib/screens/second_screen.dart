import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:perfume_shop/theme.dart';
import 'package:perfume_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:perfume_shop/screens/cardfun.dart';
import 'package:perfume_shop/l10n/string.dart';


class secondscreen extends StatefulWidget {
  const secondscreen({super.key});

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {

  bool isDarkMode = false;
  String selectedCategory = 'ALL';
  final Map<String, List<Map<String, String>>> categoryItems = {
    'ALL': [
      {'name': 'GUERLAN DIAMOND', 'image': 'assets/images/pe7.jpg', 'subtitle': 'DIAMONDS SHE 100ML. A timeless fragrance...', 'price': '70.00'},
      {'name': 'SHALIMAR INITAL', 'image': 'assets/images/pe8.jpg', 'subtitle': 'SHALIMAR SHE 100ML. Light, refreshing...', 'price': '70.00'},
      {'name': 'ARAMLILEO GARKARI', 'image': 'assets/images/pe9.jpg', 'subtitle': 'CHRAERTE. A captivating fragrance...', 'price': '70.00'},
      {'name': 'ARAMLILEO GARKARI', 'image': 'assets/images/pe11.jpg', 'subtitle': 'CHRAERTE. Designed for individuals...', 'price': '70.00'},
    ],
    'J\'ADORE': [
      {'name': 'J\'ADORE EDP', 'image': 'assets/images/pe12.jpg', 'subtitle': 'J\'ADORE 100ML', 'price': '85.00'},
    ],
    'MISS DIOR': [
      {'name': 'MISS DIOR', 'image': 'assets/images/pe3.jpg', 'subtitle': 'MISS DIOR 50ML', 'price': '75.00'},
    ],
    'POISON': [
      {'name': 'POISON GIRL', 'image': 'assets/images/pe9.jpg', 'subtitle': 'POISON 100ML', 'price': '80.00'},
    ],
    'ANGEL': [
      {'name': 'ANGEL EDP', 'image': 'assets/images/pe4.jpg', 'subtitle': 'ANGEL 50ML', 'price': '95.00'},
    ],
  };
  List<Map<String, String>> allItems = [];
  List<Map<String, String>> filteredItems = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    categoryItems.forEach((key, value) {
      allItems.addAll(value);
    });
    allItems = allItems.toSet().toList();
  }
  void searchItems(String query) {
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
        filteredItems = [];
      });
    } else {
      setState(() {
        isSearching = true;
        filteredItems = allItems.where((item) =>
        item['name']!.toLowerCase().contains(query.toLowerCase()) ||
            item['subtitle']!.toLowerCase().contains(query.toLowerCase())
        ).toList();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<ThemeProvider>(context).selectedLanguage;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                  style: TextStyle(color:constant.text2Color(context),fontSize: 24),
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
        body: Stack(
          children:[
            Positioned.fill(
              child: Image.asset('assets/images/sageback.jpg',fit: BoxFit.cover,),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView(
                  children: [
                    Stack(
                    children: [
                      Padding(
                      padding: const EdgeInsets.only(top: 80,left: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.featured(lang),style: constant.featured,),
                          Text(AppStrings.categories(lang),style: constant.categories,),
                          SizedBox( height: 40,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                AppStrings.all(lang), AppStrings.jador(lang), AppStrings.dior(lang), AppStrings.poison(lang), AppStrings.angel(lang)
                              ].map((category) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = category;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: selectedCategory == category
                                          ? Color(0xFFA3B18A)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.black38,
                                      ),
                                    ),
                                    child: Text(
                                      category,
                                      style: TextStyle(
                                        color: selectedCategory == category
                                            ? Colors.white
                                            : Color(0xFFA3B18A),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 50,),
                          SizedBox(
                            height: 350,
                            width: 850,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  card(context,'GUERLAN DIAMOND', 'assets/images/pe7.jpg', 'DIAMONDS SHE 100ML', '70.00'),
                                  SizedBox(width: 25,),
                                  card(context,'SHALIMAR INITAL', 'assets/images/pe8.jpg', 'SHALIMAR SHE 100ML', '60.00'),
                                  SizedBox(width: 25,),
                                  card(context,'ARAMLILEO GARKARI', 'assets/images/pe9.jpg', 'CHRAERTE', '90.00'),
                                  SizedBox(width: 25,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),
                        ],
                      ),
                    ),
                      Positioned(
                        top: 7,
                        left: 10,
                        width: 50,
                        height: 50,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back,color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 10,
                        width: 50,
                        height: 50,
                        child: Builder(
                          builder: (context) => IconButton(
                            icon: Icon(Icons.menu,color: Colors.black,),
                            onPressed: () => Scaffold.of(context).openEndDrawer(),
                          ),
                        ),
                      ),
                    ]
                  ),
                        if (isSearching)
                            filteredItems.isEmpty
                   ? Center(
                            child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                        'No results found',
                        style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        color:Color(0xFFA3B18A),
                        ),
                        ),
                        ),
                        )
                            : Column(
                        children: filteredItems.map<Widget>((item) =>
                        card2(
                        context,
                        item['name']!,
                        item['image']!,
                        item['subtitle']!,
                        item['price']!,
                        )
                        ).toList(),
                        ),

                        if (!isSearching)
                        SizedBox(
                        height: 800,
                        width: 600,
                        child: Padding(
                        padding: EdgeInsets.all(10),
                        child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.55,
                        children: (categoryItems[selectedCategory] ?? categoryItems['ALL']!)
                            .map<Widget>((item) => card2(
                        context,
                        item['name']!,
                        item['image']!,
                        item['subtitle']!,
                        item['price']!,
                        ))
                            .toList(),
                        ),
                        ),
                        ),
                  ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Container(
                          height: 55,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Color(0xFFA3B18A),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextField(
                            onChanged: (value) => searchItems(value),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              prefixIcon: Icon(CupertinoIcons.search, color: Colors.white),
                              hintText: AppStrings.search(lang),
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        SizedBox(width: 45),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/cart'),
                          child: Icon(CupertinoIcons.cart, size: 30, color: Color(0xFFA3B18A)),
                        ),
                        SizedBox(width: 30),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/profile'),
                          child: Icon(CupertinoIcons.profile_circled, size: 30, color: Color(0xFFA3B18A)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
