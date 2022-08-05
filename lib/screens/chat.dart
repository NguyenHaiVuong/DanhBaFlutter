import 'dart:io';

import '../component/contrast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';




final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class Chat extends StatefulWidget{
  static const String id = 'chat';
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}
class _ChatState extends State<Chat> {
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
      final user = await _auth.currentUser;
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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
        ],
        title: const Text('Flash Chat'),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messsageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messsageTextController.clear();
                      imageUrl = null;
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                        'timestamp': DateTime.now(),
                        'url': imageUrl,
                      });
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: uploadImage,
                      child: const Text('Up Image',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  uploadImage() async {
    final imagePicker = ImagePicker();
    PickedFile? image;
    UploadTask uploadTask;
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if(permissionStatus.isGranted){
      image = await imagePicker.getImage(source: ImageSource.gallery);
      var file = File(image!.path);
      if(image != null){
        var snapshot = await FirebaseStorage.instance.ref()
            .child('images/${image.path.split('/').last}')
            .putFile(file).whenComplete(() => print('success'));
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
        _firestore.collection('messages').add({
          'text':'',
          'sender': loggedInUser.email,
          'timestamp': DateTime.now(),
          'url': imageUrl
        });
      }else{
        print('No image path received');
      }
    }else{
      print('Permission not granted. Try again with permission access');
    }
  }
}
class MessageStream extends StatelessWidget{
  const MessageStream({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('timestamp').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data!.docs.reversed;
          List<MessageBubble> messageBubbles = [];
          for(var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final currentUser = loggedInUser.email;
            final messageImage = message.get('url');
            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
              url: messageImage,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        }
    );
  }
}
class MessageBubble extends StatelessWidget{
  const MessageBubble({this.sender, this.text, this.isMe, this.url});
  final String? sender;
  final String? text;
  final bool? isMe;
  final String? url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget> [
          Text(
            sender!,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 4,),
          url == null ? Row(
            mainAxisAlignment: isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Material(
                borderRadius: isMe! ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                    : const BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                elevation: 5.0,
                color: isMe! ? Colors.blueGrey : Colors.white,
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    text!,
                    style: TextStyle(
                        color: isMe! ? Colors.white : Colors.black54,
                        fontSize: 15.0
                    ),
                  ),
                ),
              ),
            ],
          ) : Container(
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
                  image: NetworkImage(url!),
                  fit: BoxFit.cover,
                )
            ),
          ),
        ],
      ),
    );
  }
}