import 'package:flutter/material.dart';
import 'package:mens_shopping_app/provider/Cart_provider.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MaterialApp(home: Cart(),));
}
class Cart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    var cartProducts = context.watch<Cart_provider>().cart;
    num totalamount = 0;
    for (var item in cartProducts) {
        totalamount += (item.price  * item.count);
    }

    return Scaffold(
      appBar: AppBar(title: Text("CART",style: TextStyle(fontSize: 25),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              children: [
                Text("Total Prducts",style:
                TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                Text("${cartProducts.length}",style:
                TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 600,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartProducts.length,
                  itemBuilder: (context,index){
                  var item = cartProducts[index];
                  totalamount = (item.price * item.count) + totalamount;
                  return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 100,width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(item.images),fit: BoxFit.cover)
                            ),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,style: TextStyle(fontSize: 15),),
                              Text(item.price.toString(),style: TextStyle(fontSize: 15),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){
                        context.read<Cart_provider>().removefromCart(item);
                      }, icon: Icon(Icons.delete,size: 30,),)
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.brown[400],
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Total Price",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                          SizedBox(height: 2,),
                          Text("${totalamount.toString()}",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: (){}, child: Text("Pay Now"),
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
