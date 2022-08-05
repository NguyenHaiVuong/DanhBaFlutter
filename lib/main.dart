// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp( const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'FireBase Connect'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   final _auth = FirebaseAuth.instance;
//   bool showSpinner = false;
//   String email = 'nguyenhaicuong@ctu.edu.vn';
//   String password = '324712321';
//
//   void _incrementCounter() async{
//     try{
//       final newUser = await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password);
//       print(newUser);
//     }catch(e){
//       print(e);
//     }
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     Firebase.initializeApp().whenComplete((){
//       print("comleted");
//       setState(() {
//
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               'Vuong',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:firebase/screens/accounts.dart';
import 'package:firebase/screens/addproduct.dart';
import 'package:firebase/screens/buyproduct.dart';
import 'package:firebase/screens/cart.dart';
import 'package:firebase/screens/editproduct.dart';
import 'package:firebase/screens/login.dart';
import 'package:firebase/screens/splashscreen.dart';
import 'package:firebase/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../screens/chat.dart';
import '../screens/gegister.dart';
import '../component/button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'splashscreen.dart';

import 'home.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatFirebase());
}
class ChatFirebase extends StatelessWidget{
  const ChatFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
        )
      ),
      initialRoute: Welcome.id,
      routes: {
        splashScreen.id: (context) => const splashScreen(),
        Welcome.id: (context) => const Welcome(),
        Login.id: (context) =>  Login(),
        Chat.id: (context) => const Chat(),
        Register.id: (context) => const Register(),
        Home.id: (context) => const Home(),
        AccountScreen.id: (context) =>  const AccountScreen(),
        CartScreen.id:(context) => const CartScreen(),
        AddProduct.id:(context) => const AddProduct(),
        editProduct.id:(context) =>  editProduct(),
        BuyProduct.id:(context) => BuyProduct(),
      },
    );
  }
}

