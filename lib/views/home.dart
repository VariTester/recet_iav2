import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recet_iav2/consent/appbar.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/main.dart';
import 'package:recet_iav2/views/detail_page.dart';
import 'package:recet_iav2/views/profile_page.dart';
import 'package:recet_iav2/views/recipe_details.dart';
import 'package:recet_iav2/views/singin_screen.dart';
import 'package:recet_iav2/views/widgets/drawer.dart';
import 'package:recet_iav2/views/widgets/recipe_card.dart';

import '../models/recipe.api.dart';
import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser;
  //text controller
  // final textController = TextEditingController();

  int indexOntap = 0;
  //parte del codigo de abajo del popular
  //gaaaa
  List<Recipe> _recipes;
  bool _isLoading = true;

   int indexx = 0;
   List category = ['Desayuno','Almuerzo', 'Cena'];

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  //aqui trato de obtener los likes
  void getLikes(){
    FirebaseFirestore.instance.collection('user').add({
      'Likes':[],
    });
  }

  Future<void> getRecipes() async{
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

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

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(

      backgroundColor: background,

      appBar: appBar(),
      

      drawer:  MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signOut,
      ),

     //codigo del otro videoooo

      body:

      _isLoading 
      ? Center(child: CircularProgressIndicator())
      : 
    CustomScrollView(
    slivers: <Widget>[
      SliverToBoxAdapter(
        child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Text('Categorias',
              style: TextStyle(
                fontSize: 20,
                color: font,
                fontFamily: 'ro',
              ),
              ),
            ),
      ),

      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        sliver: SliverToBoxAdapter(
          child: Column(children: [
            Container(
              height: 50,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context,index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    
                    onTap: () {
                      setState(() {
                        indexOntap = index;
                      });
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: indexOntap == index
                          ? maincolor
                          : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: indexOntap == index
                                ? maincolor
                                : Colors.transparent,
                              offset: indexOntap == index
                                ? Offset(1, 1)
                                : Offset(0, 0),
                              blurRadius: indexOntap == index ? 7 : 0,
                            )
                          ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 17),
                          child: Text(
                            category[index],
                            style: TextStyle(
                          fontSize: 16,
                          color: indexOntap == index
                          ? Colors.white
                          : font,
                          fontFamily: 'ro',
                    ),
                    ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text('Inicio',style: TextStyle(
                              fontSize: 20,
                              color: font,
                              fontFamily: 'ro',
                        ),),
              ],
            )
          ]),
        ),
      ),
      
    SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20), // Espacio de relleno alrededor del GridView.builder
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Número de columnas en el GridView
          crossAxisCount: 2, 
          mainAxisExtent: 300,
          // mainAxisSpacing: 10.0, // Espacio entre elementos en el eje principal (vertical)
          crossAxisSpacing: 10, // Espacio entre elementos en el eje transversal (horizontal)
          mainAxisSpacing: 15,
          // childAspectRatio: 0.8, // Relación de aspecto de los elementos
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext contex)=>Recipe_details(
                      thumbnailUrl: _recipes[index].images,
                    ),
                      
                    ),
                );
              },
              child: RecipeCard(
                //aca darle una chekeada
                
                recipeId: _recipes[index].recipeId,
                title: _recipes[index].name,
                cookTime: _recipes[index].totalTime,
                rating: _recipes[index].rating.toString(),
                thumbnailUrl: _recipes[index].images,
              ),
            );
          },
          childCount: _recipes.length,
        ),
      ),
    ),
  ],
)
   );
  }
}