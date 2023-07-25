import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mens_shopping_app/screens/Cart.dart';
import 'package:mens_shopping_app/screens/Jeans.dart';
import 'package:mens_shopping_app/screens/T-shirts.dart';
import 'package:provider/provider.dart';

import '../provider/Cart_provider.dart';
import 'Shirts.dart';
// void main(){
//   runApp(ChangeNotifierProvider(create: (BuildContext context)=>Cart_provider(),
//     child: MaterialApp(home: Home_Page(),),));
// }
void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>ChangeNotifierProvider(create: (BuildContext context)=>Cart_provider(),
        child: MaterialApp(
          home: Home_Page(),),)// Wrap your app
    ),
  );
}

class Home_Page extends StatelessWidget {

  var products =["SHIRTS","SHOES","T-SHIRTS"];
  var images =  ["assets/images/img.png","assets/images/img_1.png","assets/images/img_2.png"];
   List<Widget> screens = [Shirts(),Jeans(),T_shirts()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Mens Shoppiee",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25 ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.search,size: 30,),
                SizedBox(width: 5,),
                IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart()));
                }, icon: Icon(Icons.shopping_cart,size: 30,))
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: products.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 15,bottom: 15),
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screens[index])),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0, // soften the shadow
                          // spreadRadius: 2.0, //extend the shadow
                          offset: Offset(
                            2.0, // Move to right 5  horizontally
                            2.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage(images[index]),fit: BoxFit.cover)
                  ),
                  child: Center(
                    child: Text(products[index],style: TextStyle(
                        backgroundColor: Colors.white,
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
