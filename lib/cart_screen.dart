import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(padding: EdgeInsetsGeometry.all(8),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total : ",style: TextStyle(
                  fontSize: 20
                ),),
                Spacer(),
                Chip(label: Text('\$${cart.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),

                TextButton(onPressed: (){

                }, child: Text("Order Now")),
              ],
             ),
            ),
          ),
          SizedBox(height: 10,),
         Expanded(child: ListView.builder(itemBuilder: (ct,index)=>CartItemWidget(id: cart.items.values.toList()[index].id,
          productId: cart.items.keys.toList()[index], 
          title: cart.items.values.toList()[index].title, 
          qunatity: cart.items.values.toList()[index].quantity,
          price: cart.items.values.toList()[index].price,
          
          
          ),itemCount: cart.items.length,))

        ],
      ),
    );
  }
}
class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int qunatity;
  final double price;


  const CartItemWidget({super.key, required this.id, required this.productId, required this.title, required this.qunatity, required this.price});

  @override
  Widget build(BuildContext context) {
   return Dismissible(
  key: ValueKey(id),
  background: Container(
    color: Colors.redAccent,
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 20),
    margin: EdgeInsets.symmetric(vertical: 4,horizontal: 15),
    child: Icon(Icons.delete,color: Colors.white,size: 40,),
  ),
  direction: DismissDirection.endToStart,
  onDismissed: (direction){
    Provider.of<Cart>(context,listen: false).removeItem(productId);
  },

  child: Card(
    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
    child: ListTile(
      title: Text(title),
      subtitle: Text('Total: \$${(price * qunatity).toStringAsFixed(2)}'),
      trailing: Text('$qunatity x'),
    ),
  ),
);
  }
}