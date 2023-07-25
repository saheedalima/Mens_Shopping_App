import 'package:flutter/material.dart';
import 'package:mens_shopping_app/model/Products.dart';
import 'package:mens_shopping_app/provider/Cart_provider.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';

class Jeans extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //        itemCount: mainjeans.length,
    //          final jeanss = mainjeans[index];

    var mainjeans = context.watch<Cart_provider>().jeans;
    var jeans_cart = context.watch<Cart_provider>().cart;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart()));
        },
        child: Wrap(
          children: [
            Icon(Icons.shopping_cart,size: 30,),
            Text("${jeans_cart.length}",style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),),
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("JEANS"),),
      body: GridView.builder(
          shrinkWrap: true,
          itemCount: mainjeans.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3),
          itemBuilder: (context,index){
            final jeans_list = mainjeans[index];
            return Container(
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(jeans_list.images),fit: BoxFit.cover)
                      ),
                    ),
                  ),
                  Text(jeans_list.name,style: TextStyle(fontSize: 20),),
                  Text(jeans_list.price.toString(),style: TextStyle(fontSize: 20),),
                  ElevatedButton(onPressed: (){

                    if(!jeans_cart.contains(jeans_list)){
                      context.read<Cart_provider>().addToCart(jeans_list);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Item Already in the Cart")));
                    }
                  }, child: Text("Add to cart"))
                ],
              ),
            );
          }),
    );
  }
}
