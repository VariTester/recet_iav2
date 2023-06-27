import 'package:flutter/material.dart';

import 'colors.dart';

PreferredSizeWidget appBar(){
  return AppBar(
        elevation: 0,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('RecetIA')
        ]
        ),

          actions: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('images/p3.jpg'),
            ),
          ],

          leading: IconButton(onPressed: () {},
          icon: IconButton(
            icon: const Icon(Icons.menu,size: 27,),
          ),
          ),

        backgroundColor: maincolor,

      );
}