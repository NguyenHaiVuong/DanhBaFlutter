import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/addproduct.dart';
import 'package:firebase/screens/buyproduct.dart';
import 'package:firebase/screens/editproduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'addproduct.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    );
  }
}
final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'trangchu';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final messsageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;
  String? imageUrl;

  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Chợ Giày 2hand", style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blueGrey,
              child: IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations
                    .of(context)
                    .openAppDrawerTooltip,
                icon: Icon(
                  Icons.search,
                  size: 18, color: Colors.black,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blueGrey,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, AddProduct.id);
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations
                          .of(context)
                          .openAppDrawerTooltip,
                      icon: Icon(
                      Icons.add,
                      size: 18, color: Colors.black,),
            ),
          ),
          ),

        ],
        backgroundColor: Colors.black12,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              getProduct(),
            ],
          ),
        ),
      ),
            // _buildCoffeeProduct(),
            // _buildMlikeTeaProduct(),
            // _buildCakeProduct(),
        );
  }
}
class getProduct extends StatelessWidget {
  const getProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
        _firestore.collection('product').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }
          final indexs = snapshot.data!.docs.reversed;
          List<productModel> messageBubbles = [];
          for (var index in indexs) {
            final indexDiachi = index.get('address');
            final indexImg = index.get('image');
            final indexMoney = index.get('price');
            final indexName = index.get('name');
            final indexNameSP = index.get('nameProduct');
            final indexPhone = index.get('phone');
            final currentUser = loggedInUser.email!;
            final indexEmail = index.get('email');
            final messageBubble = productModel(
              email: indexEmail,
              address: indexDiachi,
              name: indexName,
              productName: indexNameSP,
              phoneNumber: indexPhone,
              price: indexMoney,
              isMe: currentUser == indexEmail,
              productImage: indexImg,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        });
  }
}

class productModel extends StatelessWidget {
  productModel({this.name,
    this.phoneNumber,
    this.address,
    this.price,
    this.productName,
    this.email,
    this.productImage,
    this.isMe});

  final String? address;
  final String? email;
  final String? productImage;
  final String? price;
  final String? name;
  final String? productName;
  final String? phoneNumber;
  final bool? isMe;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(bottom: 15),
        child: Container(
          child: Stack(
            children: <Widget> [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((30)),
                  boxShadow: [BoxShadow(
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                  )],
                ),
                child: Column(
                  children: <Widget> [
                    Center(
                      child: Container(
                        width: 280,
                        height: 180,
                        child: GestureDetector(
                          child: Expanded(
                            child: Image.network(productImage!, fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(productName!, style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 5,),
                    Text(price! + 'đ',
                      style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 5,),
                    Text('Người đăng: '+ email!, style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 5,),
                    FlatButton(
                      onPressed: (){
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 40,
                        width: 180,
                        child: Center(
                          child: FlatButton(
                            onPressed: (){
                              Navigator.pushNamed(context, BuyProduct.id);
                            },
                            child: Text('MUA SẢN PHẨM', style: TextStyle(
                              fontFamily: 'Anek_Malayalam',
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
              isMe! ? Positioned(
                right: 10,
                child: IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, editProduct.id);
                    },
                    icon: Icon(Icons.favorite_outline,),
                ),
              ) : SizedBox(),
            ],
          ),
        ),
        ),
      ],
    );
  }
}
