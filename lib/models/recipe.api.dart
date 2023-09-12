import 'dart:convert';
import 'package:recet_iav2/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{

static Future<List<Recipe>> getRecipe()async{
  var uri = Uri.https('yummly2.p.rapidapi.com','/feeds/list',
  {"limit": "24","start": "0","tag": "list.recipe.popular"});

  final response = await http.get(uri, headers: {
    "X-RapidAPI-Key": "bdacc3bb1emsha258d5f5d2e4895p149232jsn6dbcdd4a97c1",
	  "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
    "useQueryString" : "true"
    });

  Map data = jsonDecode(response.body);
  List _temp = [];

  for (var i in data['feed']) {
    _temp.add(i['content']);
    // _temp.add(i['content']);
  }
  print(_temp);

  return Recipe.recipesFromSnapshot(_temp);

}

}