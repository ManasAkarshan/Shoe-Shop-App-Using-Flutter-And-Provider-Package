import 'package:flutter/material.dart';

import '../models/shoe.dart';

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  ShoeTile({super.key ,required this.shoe, required this.onTap});
  Shoe shoe;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //  Shoe picture
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagePath,)
          ),

          // shoe description
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(shoe.description)
          ),

          // shoe price + details
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // shoe name 
                    Text(shoe.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    SizedBox(height: 4,),

                    //  price
                    Text('₹ ' + shoe.price),
                  ],
                ),
              ),

              //  plus button
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomRight: Radius.circular(5))
                  ),
                  child: const Icon(Icons.add, color: Colors.white,)
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}