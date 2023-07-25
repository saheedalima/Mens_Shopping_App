import 'package:flutter/material.dart';
import 'package:mens_shopping_app/provider/Cart_provider.dart';
import 'package:mens_shopping_app/screens/Cart.dart';
import 'package:provider/provider.dart';

class T_shirts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var main_tshirts = context.watch<Cart_provider>().tshirts;
    var tshirts_cart = context.watch<Cart_provider>().cart;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart()));
        },
        child: Wrap(
          children: [
            Icon(Icons.shopping_cart,size: 30,),
            Text("${tshirts_cart.length}",style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),),
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("T-SHIRTS"),),
      body: GridView.builder(
          shrinkWrap: true,
          itemCount: main_tshirts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3),
          itemBuilder: (context,index){
            final tshirts_list = main_tshirts[index];
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
                          image: DecorationImage(image: AssetImage(tshirts_list.images),fit: BoxFit.cover)
                      ),
                    ),
                  ),
                  Text(tshirts_list.name,style: TextStyle(fontSize: 20),),
                  Text(tshirts_list.price.toString(),style: TextStyle(fontSize: 20),),
                  ElevatedButton(onPressed: (){

                    if(!tshirts_cart.contains(tshirts_list)){
                      context.read<Cart_provider>().addToCart(tshirts_list);
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
