import 'package:flutter/material.dart';
import 'package:recet_iav2/consent/colors.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final void Function() onTap;
  RecipeCard({
    @required this.title,
    @required this.cookTime,
    @required this.rating,
    @required this.thumbnailUrl, this.onTap,
  });
  @override
  Widget build(BuildContext context) {

    String limitarLongitud(String oracion, int maxLetras) {
  if (oracion.length <= maxLetras) {
    return oracion;
  } else {
    return oracion.substring(0, maxLetras) + '...';
  }
}

return Container(

  width: MediaQuery.of(context).size.width,

  decoration: BoxDecoration(

    color: Colors.white,

    boxShadow: [

      BoxShadow(

        color: Color.fromARGB(255, 185, 185, 185),

        offset: Offset(1, 1),

        blurRadius: 15,

      ),

    ],

    borderRadius: BorderRadius.circular(20),

  ),

  child: Column(

    children: [

      SizedBox(height: 10),

      Padding(

        padding: const EdgeInsets.only(right: 14),

        child: Row(

          mainAxisAlignment: MainAxisAlignment.end,

          children: [

            Icon(Icons.favorite_border),

          ],

        ),

      ),

      Padding(

        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

        child: Container(

          height: 120,

          width: 120,

          decoration: BoxDecoration(

            image: DecorationImage(

              image: NetworkImage(thumbnailUrl),

              fit: BoxFit.cover,

            ),

            borderRadius: BorderRadius.circular(20),

          ),

        ),

      ),

      SizedBox(height: 10),

      Padding(

        padding: const EdgeInsets.all(2),

        child: Text(

          limitarLongitud(title, 35), // Limitar el título a 5 letras

          textAlign: TextAlign.center,

          style: TextStyle(

            fontSize: 18,

            color: maincolor,

            fontFamily: 'ro',

          ),

        ),

      ),

      SizedBox(height: 10),

      Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [

          Text(

            cookTime,

            style: TextStyle(

              fontSize: 15,

              color: acento,

              fontFamily: 'ro',

            ),

          ),

          Row(

            children: [

              Icon(Icons.star, color: maincolor, size: 15),

              Text(

                rating,

                style: TextStyle(

                  fontSize: 15,

                  color: acento,

                  fontFamily: 'ro',

                ),

              ),

            ],

          ),

        ],

      ),

    ],

  ),

);
  }
}

