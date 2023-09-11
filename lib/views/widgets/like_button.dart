import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
    
    final bool isLiked;
    void Function () onTap;

  LikeButton({Key key, 

     this.isLiked,
    this.onTap,
  
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isLiked ? Icons.favorite: Icons.favorite_border,
        color: isLiked ? Colors.red:const Color.fromARGB(255, 0, 0, 0),
      
      ),

    );
  }
}