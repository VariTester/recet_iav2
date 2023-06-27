import 'package:flutter/material.dart';
import 'package:recet_iav2/consent/appbar.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/views/widgets/recipe_card.dart';

import '../models/recipe.api.dart';
import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //gaaaa
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
    return Scaffold(

      backgroundColor: background,

      appBar: appBar(),

     //codigo del otro videoooo
      body: _isLoading 
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: ((context, index) {
          return RecipeCard(
            title: _recipes[index].name,
            cookTime: _recipes[index].totalTime,
            rating: _recipes[index].rating.toString(),
            thumbnailUrl: _recipes[index].images);
        }),
        )
        //codigo del otro videoooo


        
    );
  }
}