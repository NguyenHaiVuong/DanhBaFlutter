import 'package:firebase/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../component/button.dart';
import '../../screens/gegister.dart';
import 'package:button_navigation_bar/button_navigation_bar.dart';

class splashScreen extends StatefulWidget{
  const splashScreen({Key? key}) :super(key: key);
  static const String id ='splash_screen';
  @override
  State<splashScreen> createState() => _WelComeState();
}

class _WelComeState extends State<splashScreen> with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation? animation;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = ColorTween(begin: Colors.blue, end: Colors.white).animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
  }
  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Column(
              children: <Widget> [
                Icon(Icons.android, size: 100,),
                SizedBox(height: 75,),
                Text("Welcome back !",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Anek",
                      fontSize: 50),
                ),
                // Hero(
                //   tag: 'logo',
                //   child: Container(
                //     child: Image.asset('lib/assets/images/flashchat.png'),
                //     height: 110.0,
                //   ),
                // ),
                const Text("Do you have account?",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Anek",
                      color: Colors.black54),),
                SizedBox(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontFamily: "Anek",
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [TypewriterAnimatedText('Log In Here')],
                      onTap:(){},
                    ),
                  ),
                ),
              ],
            ),
            RoundeButton(
              title: 'Log In',
              color: Colors.blueGrey,
              onPressed: (){
                Navigator.pushNamed(context, Login.id);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                  style: TextStyle(fontSize: 18, fontFamily: "Anek"), ),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, Register.id);},
                  child: Text(" Register now",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontFamily: "Anek",
                      fontSize: 18,
                    ),),
                )
              ],
            )
            // RoundeButton(
            //   title: 'Gegister',
            //   color: Colors.blueGrey,
            //   onPressed: (){
            //     Navigator.pushNamed(context, Register.id);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

