import 'package:flutter/material.dart';
import 'package:perfume_shop/constants.dart';
import 'package:provider/provider.dart';
import 'package:perfume_shop/theme.dart';
import 'package:perfume_shop/l10n/string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Etsi';
  String email = 'etsi@email.com';
  String phone = '+251 933 333 333';
  String location = 'Ethiopia, AA';

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<ThemeProvider>(context).selectedLanguage;
    return SafeArea(
        top: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFA3B18A),
          title: Text(
            AppStrings.profile(lang),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // profile header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFA3B18A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xFFA3B18A),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      email,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),
      
              SizedBox(height: 20),
      
              // info tiles
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    profileTile(context, Icons.person_outline,AppStrings.name(lang), name),
                    profileTile(context, Icons.email_outlined, AppStrings.email(lang), email),
                    profileTile(context, Icons.phone_outlined, AppStrings.phone(lang), phone),
                    profileTile(context, Icons.location_on_outlined, AppStrings.location(lang), location),
                    SizedBox(height: 20),
      
                    // logout button
                SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA3B18A),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          AppStrings.logOut(lang),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileTile(BuildContext context, IconData icon, String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFA3B18A)),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: 'Raleway',
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}