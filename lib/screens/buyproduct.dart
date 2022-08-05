// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase/screens/search.dart';
// // import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // abstract class AddproductScreen extends StatefulWidget{
// //   static const String id ='addproduct_screen';
// //
// //    AddproductScreen({Key? key}) : super(key: key);
// //
// //   final CollectionReference _products = FirebaseFirestore.instance.collection('products');
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _priceController = TextEditingController();
// //   Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
// //     if(documentSnapshot != null){
// //       _nameController.text = documentSnapshot['name'];
// //       _priceController.text = documentSnapshot['price'].toString();
// //     }
// //
// //     var context;
// //     await showModalBottomSheet(
// //         isScrollControlled: true,
// //         context: context,
// //         builder: (BuildContext ctx){
// //           return Padding(
// //               padding: EdgeInsets.only(
// //                 top: 20,
// //                 left: 20,
// //                 right: 20,
// //                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20
// //               ),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 TextField(
// //                   controller: _nameController,
// //                   decoration: const InputDecoration(
// //                     labelText: 'Name product',
// //                   ),
// //                 ),
// //                 TextField(
// //                   keyboardType: const TextInputType.numberWithOptions(decimal: true),
// //                   controller: _priceController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Price product',
// //                   ),
// //                 ),
// //                 SizedBox(height: 20,),
// //                 ElevatedButton(
// //                     onPressed: () async {
// //                       final String name = _nameController.text;
// //                       final double? price = double.parse(_priceController.text);
// //                       if(price != null){
// //                         await _products.add({"name": name, "price": price});
// //                         _nameController.text = '';
// //                         _priceController.text = '';
// //                       }
// //                     },
// //                     child: Text('Add Product'),
// //                 ),
// //               ],
// //             ),
// //           );
// //         }
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () => _create(),
// //         child: const Icon(Icons.add),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //       backgroundColor: Colors.grey,
// //       body: StreamBuilder(
// //         stream: _products.snapshots(),
// //         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
// //           if(streamSnapshot.hasData){
// //             return ListView.builder(
// //               itemCount: streamSnapshot.data!.docs.length,
// //               itemBuilder: (context, index) {
// //                 final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
// //                 return Card(
// //                   margin: const EdgeInsets.all(10),
// //                   child: ListTile(
// //                     title: Text(documentSnapshot['name']),
// //                     subtitle: Text(documentSnapshot['price'].toString()),
// //                     trailing: SizedBox(
// //                       width: 100,
// //                       child: Row(
// //                         children: [
// //                           IconButton(
// //                               onPressed:() => _create(documentSnapshot),
// //                               icon: Icon(Icons.add),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             );
// //           }
// //           return const Center(
// //             child: CircularProgressIndicator(),
// //           );
// //         },
// //
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const Addproduct());
// }
//
// class Addproduct extends StatelessWidget {
//   const Addproduct({Key? key}) : super(key: key);
//   static const String id ='addproduct_screen';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Creat, Update and Delete products',
//       home: _Addproduct(),
//     );
//   }
// }
//
// class _Addproduct extends StatefulWidget {
//   const _Addproduct({Key? key}) : super(key: key);
//
//
//   @override
//   _AddproductState createState() => _AddproductState();
// }
//
// class _AddproductState extends State<_Addproduct> {
// // text fields' controllers
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//
//   final CollectionReference _products =
//   FirebaseFirestore.instance.collection('products');
//
//   Future<void> _create() async {
//     await showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext ctx) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 top: 20,
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   keyboardType:
//                   const TextInputType.numberWithOptions(decimal: true),
//                   controller: _priceController,
//                   decoration: const InputDecoration(
//                     labelText: 'Price',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   child: const Text('Create'),
//                   onPressed: () async {
//                     final String name = _nameController.text;
//                     final double? price =
//                     double.tryParse(_priceController.text);
//                     if (price != null) {
//                       await _products.add({"name": name, "price": price});
//                       _nameController.text = '';
//                       _priceController.text = '';
//                       Navigator.of(context).pop();
//                     }
//                   },
//                 )
//               ],
//             ),
//           );
//
//         });
//   }
//   Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
//     if (documentSnapshot != null) {
//
//       _nameController.text = documentSnapshot['name'];
//       _priceController.text = documentSnapshot['price'].toString();
//     }
//

//     await showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext ctx) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 top: 20,
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   keyboardType:
//                   const TextInputType.numberWithOptions(decimal: true),
//                   controller: _priceController,
//                   decoration: const InputDecoration(
//                     labelText: 'Price',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   child: const Text( 'Update'),
//                   onPressed: () async {
//                     final String name = _nameController.text;
//                     final double? price =
//                     double.tryParse(_priceController.text);
//                     if (price != null) {
//
//                       await _products
//                           .doc(documentSnapshot!.id)
//                           .update({"name": name, "price": price});
//                       _nameController.text = '';
//                       _priceController.text = '';
//                       Navigator.of(context).pop();
//                     }
//                   },
//                 )
//               ],
//             ),
//           );
//         });
//   }
//
//   Future<void> _delete(String productId) async {
//     await _products.doc(productId).delete();
//
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('You have successfully deleted a product')));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Center(child: Text('Firebase Firestore')),
//         ),
//         body: StreamBuilder(
//           stream: _products.snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//             if (streamSnapshot.hasData) {
//               return ListView.builder(
//                 itemCount: streamSnapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot documentSnapshot =
//                   streamSnapshot.data!.docs[index];
//                   return Card(
//                     margin: const EdgeInsets.all(10),
//                     child: ListTile(
//                       title: Text(documentSnapshot['name']),
//                       subtitle: Text(documentSnapshot['price'].toString()),
//                       trailing: SizedBox(
//                         width: 100,
//                         child: Row(
//                           children: [
//                             IconButton(
//                                 icon: const Icon(Icons.edit),
//                                 onPressed: () =>
//                                     _update(documentSnapshot)),
//                             IconButton(
//                                 icon: const Icon(Icons.delete),
//                                 onPressed: () =>
//                                     _delete(documentSnapshot.id)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
// // Add new product
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => _create(),
//           child: const Icon(Icons.add),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
//     );
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_database/screens/navbar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../home.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class BuyProduct extends StatefulWidget {
  const BuyProduct({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
    );
  }
  static const String id = 'buyproduct';

  @override
  State<BuyProduct> createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? imageUrl;
  String? messageText;
  String? nameProduct,name,phone,price,Address;

  final _formKey = GlobalKey<FormState>();
  final nameProductEditingController = new TextEditingController();
  final priceEditingController = new TextEditingController();
  final nameEditingController = new TextEditingController();
  final phoneEditingController = new TextEditingController();
  final AddressEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print('User: $user');
      }
    } catch (e) {
      print(e);
    }
  }
  void _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      nameProductEditingController.text = documentSnapshot['name'];
      priceEditingController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameProductEditingController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: priceEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String name = nameProductEditingController.text;
                    final double? price =
                    double.tryParse(priceEditingController.text);
                    if (price != null) {

                      await _firestore
                          .doc(documentSnapshot!.id)
                          .update({"name": name, "price": price});
                      nameProductEditingController.text = '';
                      priceEditingController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    final nameUser = TextFormField(
        controller: nameProductEditingController,
        validator: (value) => ((value?.length ?? 0) < 5
            ? 'At least 5 characters.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          nameProduct = value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.shopping_cart_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Tên người mua",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ));
    final phonebt = TextFormField(
        controller: phoneEditingController,
        validator: (value) => ((value?.length ?? 0) < 5
            ? 'At least 5 characters.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          phone = value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ));
    final diachibt = TextFormField(
        controller: AddressEditingController,
        validator: (value) => ((value?.length ?? 0) < 5
            ? 'At least 5 characters.'
            : null),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          Address = value.toString();
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.location_on),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Địa Chỉ",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ));
    //add button
    final addButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black54,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushNamed(context, Home.id);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Mua sản phẩm thành công !', style: TextStyle(fontSize: 19),)));
          // Addimg();
          // Navigator.pushNamed(context, HomeScreen.id);

        },
        child: const Text(
          "MUA SẢN PHẨM",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20,),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blueAccent),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
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
                  children: <Widget>[
                    const SizedBox(height: 15),
                    nameUser,
                    const SizedBox(height: 15),
                    phonebt,
                    const SizedBox(height: 15),
                    diachibt,
                    const SizedBox(height: 15),
                    addButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void Addimg() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      _firestore.collection('buyproducts').add({
        'name': name,
        'email': loggedInUser.email,
        'phone': phone,
        'address': Address,
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('You have successfully create a product')));
    } else {
      EasyLoading.showError('Can\'t Add Product!');
    }
  }
  uploadImage() async {
    final imagePicker = ImagePicker();
    PickedFile? image;
    UploadTask uploadTask;
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      image = await imagePicker.getImage(source: ImageSource.gallery);
      var file = File(image!.path);
      if (image != null) {
        var snapshot = await FirebaseStorage.instance
            .ref()
            .child('img/${image.path.split('/').last}')
            .putFile(file)
            .whenComplete(() => print('success'));
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No image path received');
      }
    } else {
      print('Permission not granted. Try again with permission access');
    }
  }
}


