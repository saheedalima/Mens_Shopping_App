import 'package:flutter/cupertino.dart';
import 'package:mens_shopping_app/model/Products.dart';

final List<Products> shirts_provider = [
  Products(name: "OTTO", price: 1500, images: "assets/images/img_3.png"),
  Products(name: "DAVIZ", price: 2000, images: "assets/images/img_4.png"),
  Products(name: "FORMALS", price: 1000, images: "assets/images/img_5.png"),
  Products(name: "CLASSIC", price: 800, images: "assets/images/img_6.png"),
  Products(name: "DENIM", price: 3000, images: "assets/images/img_7.png"),
];
final Jeans_provider =[
  Products(name: "TRACK", price: 1500,  images: "assets/images/img_10.png"),
  Products(name: "DENIM", price:  2000, images: "assets/images/img_11.png"),
  Products(name: "CASUALS", price: 100, images: "assets/images/img_12.png"),
  Products(name: "CLASSIC", price: 800, images: "assets/images/img_13.png"),
  Products(name: "SHOW", price:  3000,images: "assets/images/img_14.png"),
];
final T_shirt_prvider =[
Products(name: "Full Sleeve", price: 1500, images: "assets/images/img_15.png"),
Products(name: "Hoddies", price: 2000, images: "assets/images/img_16.png"),
Products(name: "Half sleev", price: 1000, images: "assets/images/img_17.png"),
Products(name: "Casuals", price: 800, images: "assets/images/img_18.png"),
Products(name: "Baniyans", price: 3000, images: "assets/images/img_19.png"),
];

class Cart_provider with ChangeNotifier{

  final List<Products> _shirts = shirts_provider;
  List<Products> get shirts => _shirts;

  final List<Products> _jeans_list = Jeans_provider;
  List<Products> get jeans => _jeans_list;

  final List<Products> _tshirt_list = T_shirt_prvider;
  List<Products> get tshirts => _tshirt_list;

  final List<Products> _cart = [];
  List<Products> get cart => _cart;

  void addToCart(Products products_toCart){
    int index = _cart.indexWhere((element) => element==products_toCart);
    if(index!= -1){
      products_toCart.count = products_toCart.count + 1;
    }else{
      _cart.add(products_toCart);
    }
    notifyListeners();
  }

  void removefromCart(Products products_remove){
    int index = _cart.indexWhere((element) => element == products_remove);
    if(_cart[index].count > 1){
      _cart[index].count--;
    }else{
      _cart.removeAt(index);
    }
    notifyListeners();
  }
}