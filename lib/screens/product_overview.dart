import 'package:flutter/material.dart';
import 'products.dart';
import 'homescreen.dart';
class ProductOverview extends StatefulWidget {
  static const String id = 'product_overview';
  const ProductOverview({Key? key}) : super(key: key);
  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}
  class _ProductOverviewState extends State<ProductOverview>{
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Overview",
          ),
        ),
      );
  }

}