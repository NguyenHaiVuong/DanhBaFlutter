import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/login.dart';
import 'package:firebase/screens/user_model.dart';
import 'package:firebase/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const String id ='account_screen';
  @override
  _AccountScreenStateState createState() => _AccountScreenStateState();
}

class _AccountScreenStateState extends State<AccountScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  Widget listTitle({required IconData icon, required String title, required onPress}){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
            ),

            child: ListTile(
              leading: Icon(icon, color: Colors.black,),
              title: Text(title,style: TextStyle(fontSize: 18),),
              onTap: onPress,
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("My profile",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.blueGrey,
              ),
              Container(
                height: 580,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${loggedInUser.userName}",  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("${loggedInUser.email}", style: TextStyle(
                                    fontSize: 16
                                  ),),
                                ],
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white24,
                                child: CircleAvatar(
                                  radius: 18,
                                  child: IconButton(
                                    color: Colors.black,
                                    onPressed: uploadImage,
                                    icon: const Icon(Icons.edit, size: 22,),
                                  ),
                                  backgroundColor: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTitle(
                        onPress: (){},
                        icon: Icons.shop_outlined,
                        title : "My Orders",
                    ),
                    listTitle(
                      onPress: (){},
                      icon: Icons.location_on_outlined,
                      title: "My Delivery Address",
                    ),
                    listTitle(
                      onPress: (){},
                      icon: Icons.shop_outlined,
                      title: "Refer A Friends",
                    ),
                    listTitle(
                      onPress: (){},
                      icon: Icons.file_copy_outlined,
                      title: "Teams And Conditions",
                    ),
                    listTitle(
                      onPress: (){
                        Navigator.pushNamed(context, Welcome.id);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Đăng xuất thành công !!!', style: TextStyle(
                              fontSize: 19,
                            ),)));
                      },
                      icon: Icons.logout,
                      title: "Log Out",
                    ),
                  ],
                ),
              ),
            ],
          ),
          imageUrl != null ?
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 40),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blueGrey,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl!),
                radius: 50,
                // backgroundColor: ,
              ),
            ),
          ) : Padding(
            padding: const EdgeInsets.only(top: 40, left: 40),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blueGrey,
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/images/Hinh-Anime-Conan-cool-ngau-nhat.jpg'),
                radius: 50,
                // backgroundColor: ,
              ),
            ),
          ),
        ],
      ),
    );
  }
  // void Addimg() {
  //   final FormState? form = _formKey.currentState;
  //   if (form!.validate()) {
  //     _firestore.collection('product').add({
  //       'image': imageUrl,
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('You have successfully create a product')));
  //   } else {
  //   }
  // }
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
            .child('avatarimage/${image.path.split('/').last}')
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