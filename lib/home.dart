import 'package:firebase/screens/accounts.dart';
import 'package:firebase/screens/cart.dart';
import 'package:firebase/screens/chat.dart';
import 'package:firebase/screens/editproduct.dart';
import 'package:firebase/screens/homescreen.dart';
import 'package:firebase/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../component/button.dart';
import '../../screens/gegister.dart';
import 'package:button_navigation_bar/button_navigation_bar.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) :super(key: key);
  static const String id ='home_screen';
  @override
  State<Home> createState() => _MyhomeState();
}

class _MyhomeState extends State<Home>{
  List pages = [
     HomeScreen(),
     editProduct(),
     Chat(),
     AccountScreen(),
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits_outlined),
              label: "Product"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: "Account"),
        ],
      ),
    );
  }
}

