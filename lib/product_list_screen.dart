import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/data.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('food order app'),
        actions: [
          Padding(padding: EdgeInsets.all(10),
          child: IconButton(onPressed: (){

          }, icon: Icon(Icons.shopping_cart_checkout)),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: DUMMY_PRODUCTS.length,
        itemBuilder: (ctx,i)=>ListTile(
          title: Text(DUMMY_PRODUCTS[i]['title']as String),
          subtitle: Text('\$${DUMMY_PRODUCTS[i]['price']}'),
          trailing: IconButton(onPressed:(){
            Provider.of<Cart>(context,listen: false).addItem( 
              DUMMY_PRODUCTS[i]['id']as String,
              DUMMY_PRODUCTS[i]['price']as double,
              DUMMY_PRODUCTS[i]['title']as String,
            );
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Cart')));
          } , icon: Icon(Icons.add)),

      )),
    );
  }
}