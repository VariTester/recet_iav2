import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recet_iav2/consent/appbar.dart';
import 'package:recet_iav2/views/profile_page.dart';
import 'package:recet_iav2/views/singin_screen.dart';
import 'package:recet_iav2/views/widgets/drawer.dart';
import 'package:recet_iav2/views/widgets/recipe_card_favorites.dart';

import '../models/recipe.api.dart';
import '../models/recipe.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
   
  List<Recipe> _favoriteRecipes = [];

  bool _isLoading = true;

    @override
  void initState() {
    super.initState();

    getFavoriteRecipes();
  }
    Future<void> getFavoriteRecipes() async {
    // Obtén el usuario actualmente autenticado
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Obtén las recetas favoritas del usuario actual desde Firestore
      final userRef = FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
      final userData = await userRef.get();

      if (userData.exists) {
        // final likes = userData.data()?['likes'] as Map<String, dynamic>;
        final likes = userData.data()['likes'] as Map <String, dynamic>;

        // Filtra las recetas favoritas en función de los "likes" del usuario
        final favoriteRecipeIds = likes.keys.toList();
        final allRecipes = await RecipeApi.getRecipe(); // Obtén todas las recetas

        setState(() {
          _favoriteRecipes = allRecipes.where((recipe) => favoriteRecipeIds.contains(recipe.recipeId)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
  // Future<void> getRecipes() async{
  //   // Obtén el usuario actualmente autenticado
    
  //   // _recipes = await RecipeApi.getRecipe();
  //   // setState(() {
  //   //   _isLoading = false;
  //   // });
  //   // print(_recipes);
  // }
  
  @override

  Widget build(BuildContext context) {
      
      void goToProfilePage(){
        //pop menu drawer
        Navigator.pop(context);
        //go to profile page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=> const ProfilePage(),
          ),
        );
      }

      void signOut(){
        //pop menu drawer
        Navigator.pop(context);
        //go to profile page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)=> const SingInScreen(),
          ),
        );
      }
    
    return Scaffold(
      appBar: appBarFavorite(),
      drawer:  MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signOut,
      ),
      
       body:
       _isLoading 
      ? const Center(child: CircularProgressIndicator())
      : 
       CustomScrollView(
        
          slivers:<Widget> [

            
            // SizedBox(height: 15,),
            // Row(
            //   children: [
            //     Text('Inicio',style: TextStyle(
            //                   fontSize: 20,
            //                   color: Colors.amber,
            //                   fontFamily: 'ro',
            //             ),),
            //   ],
            // ),

           SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
             sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                return Container(
                  decoration:  BoxDecoration(
                    color: Colors.amber,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 185, 185, 185),
                        offset:Offset(1, 1),
                        blurRadius: 15,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: RecipeCardFavorites(title: _favoriteRecipes[index].name,
                  cookTime: _favoriteRecipes[index].totalTime,
                  rating: _favoriteRecipes[index].rating.toString(),
                  thumbnailUrl: _favoriteRecipes[index].images,)

                );
              },
              //cantidad de elementos
              childCount: _favoriteRecipes.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //columnas
                crossAxisCount: 1,
                mainAxisExtent: 320,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                ),
                
                
                
                ),
           )
          ],
          
        )
      
      
      // child: Text('PARTE DE FAVORITOOOOS'),
    );
  }
}