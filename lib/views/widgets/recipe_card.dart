// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/views/widgets/like_button.dart';

// import 'package:recet_iav2/views/widgets/like_button.dart';

class RecipeCard extends StatefulWidget {

  // final String user;
  //una lista de las recetas que te gustan  
  // final List<String> likes;
  
  //del otro video
  final String recipeId;
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final void Function(String) onTap;
  const RecipeCard({Key key,
    // @required this.user,
    // @required this.likes,
    
     this.recipeId,
     this.title,
     this.cookTime,
     this.rating,
     this.thumbnailUrl, this.onTap,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {

  //vamos a obtener el usuario de firebase
  final currentUser = FirebaseAuth.instance.currentUser;
  bool isLiked = false;
  
@override
void initState() {
  super.initState();

  // Consulta la información de "Me gusta" del usuario actual
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

  userRef.get().then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      // Convierte los datos del documento Firestore en un mapa
      Map<String, dynamic> userData = documentSnapshot.data() as Map<String, dynamic>;

      // Verifica si 'likes' existe en los datos del usuario
      if (userData.containsKey('likes')) {
        // Obtiene el mapa de 'likes'
        var likesMap = userData['likes'] as Map<String, dynamic>;

        // Verifica si 'widget.recipeId' existe en el mapa de 'likes'
        if (likesMap.containsKey(widget.recipeId)) {
          // Si existe, establece 'isLiked' en true
          setState(() {
            isLiked = true;
          });
        }
      }
    }
  });
}


  void addLike(String recipeId) async{
  setState(() {
    isLiked = !isLiked;
  });
    // Obtén una referencia al documento del usuario actual
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
  // DocumentReference postRef = FirebaseFirestore.instance.collection('users').doc(widget.recipeId);

  if(isLiked){
      // Agregar el ID de la receta a la lista de "likes" del usuario
      await userRef.update({'likes.$recipeId' :true});
      // postRef.update({
      //   'likes': FieldValue.arrayUnion([currentUser.email]),
      // }); 
      
  // await userRef.update({
  //   // 'likes': FieldValue.arrayUnion([recipeId]),
  //   // 'likes': FieldValue.arrayUnion([currentUser.email]),
    
  // });
  // print(recipeId);
  }else{
      // Quitar el ID de la receta de la lista de "likes" del usuario
      await userRef.update({
        'likes.$recipeId': FieldValue.delete(),
        
      });

  }

}


  @override
  Widget build(BuildContext context) {

    String limitarLongitud(String oracion, int maxLetras) {
  if (oracion.length <= maxLetras) {
    return oracion;
  } else {
    return '${oracion.substring(0, maxLetras)}...';
  }
}

return Container(

  width: MediaQuery.of(context).size.width,

  decoration: BoxDecoration(

    color: Colors.white,

    boxShadow: const [

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

          children:  [
            Column(
              children: [
                LikeButton(
                  isLiked: isLiked,
                  //gaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                  onTap: () {
                    addLike(widget.recipeId);
                  },
                  
                ),
                
              ],
            )
          

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

              image: NetworkImage(widget.thumbnailUrl),

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

          limitarLongitud(widget.title, 35), // Limitar el título a 5 letras

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

            widget.cookTime,

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

                widget.rating,

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

