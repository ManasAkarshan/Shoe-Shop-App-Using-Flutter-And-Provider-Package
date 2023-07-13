import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier{

    // List of shoe for sale
    List<Shoe> shoeShop = [
      Shoe(name: 'Nike', price: '2399', imagePath: 'assets/images/shoe4.png', description: "Best sneaker in them market with four years of warranty"),
      Shoe(name: 'Adidas', price: '7399', imagePath: 'assets/images/shoe5.png', description: "Best sneaker in them market with four years of warranty"),
      Shoe(name: 'Gucci', price: '3799', imagePath: 'assets/images/shoe6.png', description: "Best sneaker in them market with four years of warranty"),
      Shoe(name: 'Armaani', price: '6399', imagePath: 'assets/images/shoe7.png', description: "Best sneaker in them market with four years of warranty"),
      Shoe(name: 'Puma', price: '9339', imagePath: 'assets/images/shoe8.png', description: "Best sneaker in them market with four years of warranty"),
    ];

    // List of items in user cart
    List<Shoe> userCart = [];

    // get list of shoe for sale
    List<Shoe> getShopList(){
      return shoeShop;
    }

    // get cart
    List<Shoe> getUserCart(){
      return userCart;
    } 

    // add items to cart
    void addItemToCart(Shoe shoe){
      userCart.add(shoe);
      notifyListeners();
    }

    // remove items from cart
    void removeFromCart(Shoe shoe){
      userCart.remove(shoe);
      notifyListeners();
    }
}