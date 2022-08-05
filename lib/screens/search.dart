import 'package:flutter/material.dart';
class SearchItem extends StatelessWidget{
  const SearchItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: 100,
              child: Center(
                 child: Image.network("https://product.hstatic.net/1000075078/product/bac-siu-da_9bf82220a1a54847aa7357de541e7552_large.jpg"),
              ),
            ),
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("ProductName",
                    style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18
                    ),),
                    Text("ProductName",
                      style: TextStyle(
                      ),),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 35 ,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text('15.000 đ', style: TextStyle(
                            color: Colors.black, fontSize: 14,
                          ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 35 ,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.remove, size: 20, color: Colors.black,),
              Text(' 1 ', style: TextStyle(
                color: Colors.black, fontSize: 17,
              ),),
              Icon(Icons.add, size: 20, color: Colors.black,),
            ],
          ),
        ),
      ],
    );
  }
}