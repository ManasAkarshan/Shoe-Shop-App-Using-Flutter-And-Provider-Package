import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Shoe shoe = Shoe(
    //     name: 'Bata',
    //     price: '2000',
    //     description: 'good shoe',
    //     imagePath: 'assets/images/shoe4.png');

    // Adding shoe to cart

    void addShoeToCart(Shoe shoe){
      Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

      showDialog(context: context, builder: (context){
        return const AlertDialog(
          title: Text('Successfully added to cart'),
          content: Text('Check your cart'),
        );
      });
    }

    return Consumer<Cart>(builder: (context, value, child) {
      return Column(
        children: [
          //  Search bar
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(4)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search'),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),

          //  message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'everyone flies.. some fly longer than others',
              style: TextStyle(color: Colors.grey),
            ),
          ),

          //  hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('HOT PICKS🔥',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text('See all',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
          ),

          const SizedBox(
            height: 12,
          ),

          // Shoe tile
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShopList()[index];
                  return ShoeTile(
                    shoe: shoe,
                    onTap: (){addShoeToCart(shoe);},
                  );
                }),
          ),

          // Adding a divider
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.black,
            ),
          )
        ],
      );
    });
  }
}
