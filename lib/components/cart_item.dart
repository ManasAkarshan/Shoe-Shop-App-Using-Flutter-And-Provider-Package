import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../models/cart.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.shoe});
  final Shoe shoe;


  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart

  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        subtitle: Text("₹ ${widget.shoe.price}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: (){removeItemFromCart();},
        ),
      ),
    );
  }
}