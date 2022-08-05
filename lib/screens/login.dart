// import 'package:firebase/component/button.dart';
// import 'package:firebase/component/contrast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import '../../screens/chat.dart';
// class Login extends StatefulWidget{
//   const Login({Key? key}): super(key: key);
//   static const String id = 'login';
//   @override
//   State<Login> createState() => _LoginState();
// }
// class _LoginState extends State<Login>{
//   bool showSpinner = false;
//   final _auth = FirebaseAuth.instance;
//   String? email;
//   String? password;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Flexible(
//                 child: Hero(
//                   tag: 'logo',
//                   child: Container(
//                     height: 200,
//                     child: Image.asset('lib/assets/images/flashchat.png'),
//                   ),
//                 ),
//             ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             TextField(
//               keyboardType: TextInputType.emailAddress,
//               textAlign: TextAlign.center,
//               onChanged: (value){
//                 email = value;
//               },
//               decoration: kTextFieldDecoration.copyWith(
//                 hintText: 'Enter your email',
//               ),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             TextField(
//               obscureText: true,
//               textAlign: TextAlign.center,
//               onChanged: (value){
//                 password = value;
//               },
//               decoration: kTextFieldDecoration.copyWith(
//                 hintText: 'Enter your password',
//               ),
//             ),
//             const SizedBox(
//               height: 24.0,
//             ),
//             RoundeButton(
//               title: 'Log In',
//               color: Colors.lightBlue,
//               onPressed: () async {
//                 setState(() {
//                   showSpinner = true;
//                 });
//                 try {
//                   final users = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
//                   if ( users != null){
//                     print(users);
//                     Navigator.pushNamed(context, Chat.id);
//                 }
//                   setState(() {
//                     showSpinner = false;
//                   });
//                 }catch(e) {
//                   print(e);
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }

import 'package:firebase/main.dart';
import 'package:firebase/screens/accounts.dart';
import 'package:firebase/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../home.dart';
import '../screens/chat.dart';
import '../component/button.dart';
import '../component/contrast.dart';
import 'gegister.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'homescreen.dart';
void main()  {
  // await Hive.initFlutter();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EasyLoading',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    );
  }
}
class Login extends StatefulWidget{
  const Login({Key? key}): super(key: key);
  static const String id = 'login';
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login>{
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  late Box box1;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In", style: TextStyle(color: Colors.black54),),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.android_outlined, size: 100,),
            const Text("Sign In with your email and  password.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontFamily: "Anek",
                fontStyle: FontStyle.italic,
              ) ,),
            const SizedBox(
              height: 50.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                hintText: 'Enter your password',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Remember Me', style: TextStyle(fontSize: 17, color: Colors.black), ),
                Checkbox(value: showSpinner, onChanged: (value){
                  showSpinner = !showSpinner;
                  setState(() {
                  });
                }),
              ],
            ),
            RoundeButton(
              title: 'Log In',
              color: Colors.blueGrey,
              onPressed: () async {
                setState(() {
                  // showSpinner = true;
                });
                try {
                  final users = (await _auth.signInWithEmailAndPassword(
                      email: email!, password: password!)) ;
                  if ( users != null){
                    Navigator.pushNamed(context, Home.id);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Đăng nhập thành công !!!', style: TextStyle(
                          fontSize: 19,
                        ),)));
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }catch(e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Sai tài khoản hoặc mật khẩu !!!', style: TextStyle(
                          fontSize: 19,
                        ),)));
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}