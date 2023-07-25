import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/Cart_provider.dart';

class shirt_Ref extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var mainshirt = context.watch<Cart_provider>().shirts;
    var myCart = context.watch<Cart_provider>().cart;

    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(""))
            ),
          )
        ],
      ),
    );
  }
}
