import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'addproduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Firestore',
    );
  }
}

class CartScreen extends StatefulWidget {
  static String id = 'cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
// text fields' controllers
  final TextEditingController _nameProductController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final CollectionReference _products =
  FirebaseFirestore.instance.collection('cartproducts');
  final _auth = FirebaseAuth.instance;
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _imageController.text = documentSnapshot['image'];
      _nameProductController.text = documentSnapshot['nameProduct'];
      _priceController.text = documentSnapshot['price'];
      _emailController.text = documentSnapshot['email'];
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
                  controller: _imageController,
                  decoration: const InputDecoration(
                    labelText: 'Image Product',
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: _nameProductController,
                  decoration: const InputDecoration(
                    labelText: 'Name Product',
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  // keyboardType:
                  // const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: MaterialButton(
                    hoverColor: Colors.blueGrey,
                    color: Colors.grey,
                    child: const Text( 'CẬP NHẬT SẢN PHẨM', style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17
                    ),),
                    onPressed: () async {
                      final String name = _nameProductController.text;
                      final String price = _priceController.text;
                      final String image = _imageController.text;
                      if (price != null) {
                        await _products
                            .doc(documentSnapshot!.id)
                            .update({ "image": image,"nameProduct": name, "price": price});
                        _priceController.text = '';
                        _nameProductController.text = '';
                        _priceController.text = '';
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Cập nhật sản phẩm thành công !', style: TextStyle(fontSize: 19),)));
                      }
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Xóa sản phẩm thành công !', style: TextStyle(fontSize: 19),)));
  }
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print('Imformation of user: $user');
      }
    } catch (e) {
      print(e);
    }
  }
  String? curentUser = loggedInUser.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Danh sách sản phẩm của bạn', style: TextStyle(
            color: Colors.black,
          ),)),
        ),
        body: StreamBuilder(
          stream: _products.snapshots(), //build connection
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,  //number of rows
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
                  return
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 1,
                      color: Colors.white24,
                      borderOnForeground: true,
                      child: Padding(
                        padding: EdgeInsets.only(right: 25, left: 25, bottom: 20, top: 25),
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.only(left: 140, bottom: 140),
                                    onPressed: (){
                                      // _update(documentSnapshot);
                                    },
                                    icon: Icon(Icons.edit,),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.only(left: 1, bottom: 140),
                                    onPressed: (){
                                      // _delete(documentSnapshot.id);
                                    },
                                    icon: Icon(Icons.delete,),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width/1.9,
                              height: 180,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 0.5,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage(documentSnapshot['image'],),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            SizedBox(width: 25,),
                            Column(
                              children: [
                                Text(documentSnapshot['nameProduct'],style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),),
                                SizedBox(height: 20,),
                                Text(documentSnapshot['price'],style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ],
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
// Add new product
    );
  }
}