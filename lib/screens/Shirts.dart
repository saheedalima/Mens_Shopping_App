import 'package:flutter/material.dart';
import 'package:mens_shopping_app/model/Products.dart';
import 'package:mens_shopping_app/provider/Cart_provider.dart';
import 'package:mens_shopping_app/screens/Cart.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(create: (BuildContext context)=>Cart_provider(),
    child: MaterialApp(home: Shirts(),),));
}
class Shirts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var mainshirt = context.watch<Cart_provider>().shirts;
    var myCart = context.watch<Cart_provider>().cart;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart()));
          },
        child: Wrap(
          children: [
            Icon(Icons.shopping_cart,size: 30,),
            Text("${myCart.length}",style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),),
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("SHIRTS"),),

      body: GridView.builder(
        shrinkWrap: true,
        itemCount: mainshirt.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3),
          itemBuilder: (context,index){
            final shirt_list = mainshirt[index];
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
                        image: DecorationImage(image: AssetImage(shirt_list.images),fit: BoxFit.cover)
                      ),
                    ),
                  ),
                  Text(shirt_list.name,style: TextStyle(fontSize: 20),),
                  Text(shirt_list.price.toString(),style: TextStyle(fontSize: 20),),
                  ElevatedButton(onPressed: (){

                    if(!myCart.contains(shirt_list)){
                      context.read<Cart_provider>().addToCart(shirt_list);
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
