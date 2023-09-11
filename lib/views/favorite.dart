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
  List<Recipe> _recipes;
  bool _isLoading = true;

    @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async{
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // print(_recipes);
  }
  
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
                  child: RecipeCardFavorites(title: _recipes[index].name,
                cookTime: _recipes[index].totalTime,
                rating: _recipes[index].rating.toString(),
                thumbnailUrl: _recipes[index].images,)
                  // Column(
                  //   children: [
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Row(
                  //       children: [
                  //         Icon(Icons.favorite)
                  //       ],
                  //     )
                  //   ],
                  // ),
                );
              },
              //cantidad de elementos
              childCount: 6,
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