import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/product_overview.dart';
import 'package:flutter/material.dart';
import 'addproduct.dart';

class SingalProduct extends StatelessWidget{
  final _products = FirebaseFirestore.instance;
  final String? address;
  final String? email;
  final String? image;
  final String? price;
  final String? name;
  final String? nameProduct;
  final String? phone;
  final bool? isMe;
  SingalProduct({
    this.name,
    this.phone,
    this.address,
    this.price,
    this.nameProduct,
    this.email,
    this.image,
    this.isMe});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: StreamBuilder<QuerySnapshot>(
         stream: _products.collection('products').snapshots(),
         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
           return Row(
             children: [
                 Container(
                 margin: EdgeInsets.symmetric(horizontal: 5),
                 height: 230,
                 width: 150,
                 decoration: BoxDecoration(
                   color: Colors.white24,
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: Column(
                   children: [
                     // SizedBox(height: 5,
                     // ),
                     GestureDetector(
                       child: Expanded(
                         child: Image.network(image!, fit: BoxFit.fill,
                         ),
                         flex:2,
                       ),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 10,
                             vertical: 5),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(nameProduct!,
                               style: TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             SizedBox(height: 12,),
                             Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     padding: EdgeInsets.only(left: 3),
                                     height: 30,
                                     width: 50,
                                     decoration: BoxDecoration(
                                       border: Border.all(
                                           color: Colors.blueGrey
                                       ),
                                       borderRadius: BorderRadius.circular(10),
                                     ),
                                     child: Row(
                                       children: [
                                         Expanded(
                                           child: Text(price!,
                                             style: TextStyle(
                                               fontSize: 12,
                                               fontWeight: FontWeight.w400,
                                             ),
                                           ),
                                         ),
                                         Center(
                                           child: Icon(
                                             Icons.arrow_drop_down,
                                             size: 20,
                                             color: Colors.blueGrey,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 SizedBox(width: 5,),
                                 Expanded(
                                   child: Container(
                                     height: 30,
                                     width: 50,
                                     decoration: BoxDecoration(
                                       border: Border.all(
                                           color: Colors.blueGrey
                                       ),
                                       borderRadius: BorderRadius.circular(10),
                                     ),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Icon(Icons.remove, size: 15, color: Colors.blueGrey,),
                                         Text(' 1 '),
                                         Icon(Icons.add, size: 15, color: Colors.blueGrey,),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           );
         }
       ),
     );
  }
}