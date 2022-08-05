// // import 'package:firebase/screens/login.dart';
// // import 'package:firebase/screens/welcome.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import '../screens/chat.dart';
// // import '../component/button.dart';
// // import 'package:firebase/component/contrast.dart';
// // import 'package:flutter_easyloading/flutter_easyloading.dart';
// // class Register extends StatefulWidget{
// //   const Register({Key? key}): super(key: key);
// //   Widget build(BuildContext context){
// //     return MaterialApp(
// //       builder: EasyLoading.init(),
// //     );
// //   }
// //
// //   static const String id = 'Gegister';
// //   @override
// //   State<Register> createState() => _RegisterState();
// // }
// // class _RegisterState extends State<Register>{
// //   bool showSpinner = false;
// //   final _auth = FirebaseAuth.instance;
// //   String? email;
// //   String? password;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: <Widget>[
// //             Flexible(
// //               child: Hero(
// //                 tag: 'logo',
// //                 child: SizedBox(
// //                   height: 200,
// //                   child: Image.asset('lib/assets/images/flashchat.png'),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 48.0,
// //             ),
// //             TextField(
// //               keyboardType: TextInputType.emailAddress,
// //               textAlign: TextAlign.center,
// //               onChanged: (value){
// //                 email = value;
// //               },
// //               decoration: kTextFieldDecoration.copyWith(
// //                 hintText: 'Enter your email',
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 8.0,
// //             ),
// //             TextField(
// //               obscureText: true,
// //               textAlign: TextAlign.center,
// //               onChanged: (value){
// //                 password = value;
// //               },
// //               decoration: kTextFieldDecoration.copyWith(
// //                 hintText: 'Enter your password',
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 24.0,
// //             ),
// //             RoundeButton(
// //               title: 'Gegister',
// //               color: Colors.blue,
// //               onPressed: () async {
// //                 setState(() {
// //                   showSpinner = true;
// //                 });
// //                 try {
// //                   final users = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
// //                   if ( users != null){
// //                     EasyLoading.showSuccess('Great Success!');
// //                     Navigator.pushNamed(context, Login.id);
// //                   }
// //                   setState(() {
// //                     showSpinner = false;
// //                   });
// //                 }catch(e) {
// //                   print(e);
// //                 }
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import '../component/button.dart';
// import '../component/contrast.dart';
// import '../screens/login.dart';
// class Register extends StatefulWidget{
//   const Register({Key? key}): super(key: key);
//   static const String id = 'register';
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register>{
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
//               child: Hero(
//                 tag: 'logo',
//                 child: SizedBox(
//                   height: 200,
//                   child: Image.asset('lib/assets/images/flashchat.png'),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 48.0,
//             ),
//             TextField(
//               keyboardType: TextInputType.emailAddress,
//               textAlign: TextAlign.center,
//               onChanged: (value){
//                 email = value;
//               },
//               decoration: kTextFieldDecoration.copyWith(
//                 hintText: 'Enter your name',
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
//                 hintText: 'Enter your email',
//               ),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             TextField(
//               keyboardType: TextInputType.emailAddress,
//               textAlign: TextAlign.center,
//               onChanged: (value){
//                 email = value;
//               },
//               decoration: kTextFieldDecoration.copyWith(
//                 hintText: 'Enter your phone number',
//               ),
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
//               height: 24.0,
//             ),
//             RoundeButton(
//               title: 'register',
//               color: Colors.blueAccent,
//               onPressed: () async {
//                 setState(() {
//                   showSpinner = true;
//                 });
//                 try {
//                   final users = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
//                   if ( users != null){
//                     Navigator.pushNamed(context, Login.id);
//                   }
//                   setState(() {
//                     EasyLoading.showSuccess('Great Success!');
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
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/homescreen.dart';
import 'package:firebase/screens/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../component/button.dart';
import '../component/contrast.dart';
import '../screens/login.dart';
import 'package:firebase_storage/firebase_storage.dart';
class Register extends StatefulWidget{
  const Register({Key? key}): super(key: key);
  static const String id = 'register';
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final fullNameEdittingController = new TextEditingController();
  final emailEdittingController = new TextEditingController();
  final passwordEdittingController = new TextEditingController();
  final confirmpasswordEdittingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fullNameField = TextFormField(
      autofocus: false,
      controller: fullNameEdittingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value){
        fullNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Full Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEdittingController,
      keyboardType: TextInputType.emailAddress,

      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value){
        emailEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEdittingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value){
        passwordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordEdittingController,
      obscureText: true,
      validator: (value) {
        if (passwordEdittingController.text !=
            confirmpasswordEdittingController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value){
        confirmpasswordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final signButton = RoundeButton(
              title: 'ĐĂNG KÝ',
              color: Colors.grey,
              onPressed: () async {
               signUp(emailEdittingController.text, passwordEdittingController.text);
              }
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    SizedBox(
                      height: 180,
                      child: Icon(Icons.android, size: 100,),
                    ),
                    SizedBox(height: 15,),
                    fullNameField,
                    SizedBox(height: 15,),
                    emailField,
                    SizedBox(height: 15,),
                    passwordField,
                    SizedBox(height: 15,),
                    confirmpasswordField,
                    SizedBox(height: 15,),
                    signButton,
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signUp(String email, String password) async {
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password).then((value) => {postDetailsToFirestore(),
          }).catchError((e){
      }
      );
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    userModel.email = user!.email!;
    userModel.uid = user.uid;
    userModel.userName = fullNameEdittingController.text;

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Đăng ký thành công !', style: TextStyle(fontSize: 19),)));
    Navigator.pushNamed(context, Login.id);
  }
}