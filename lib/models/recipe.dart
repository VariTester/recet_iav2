// import 'dart:html';

// import 'package:flutter/cupertino.dart';

import 'package:recet_iav2/views/widgets/ingredientLine.dart';

class Recipe{
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final String recipeId;
  final List<dynamic> ingredientLines;
  final List<dynamic> preparationSteps;
  

  Recipe({this.name,this.images,this.rating,this.totalTime
  ,this.recipeId,this.ingredientLines,this.preparationSteps
  });

  factory Recipe.fromJson(dynamic json){
    return Recipe(
      name: json['details']['name'] as String,
      images: json['details']['images'][0]['hostedLargeUrl'] as String,
      rating: json['details']['rating'] as double,
      totalTime: json['details']['totalTime'] as String,
      recipeId:json['details']['recipeId'] as String,

      ingredientLines:json['ingredientLines'] as List<dynamic>,

      preparationSteps: json['preparationSteps'] as List<dynamic>,


      
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot){
    return snapshot.map(
      (data){
        return Recipe.fromJson(data);
      }
    ).toList();
  } 


  @override 
  String toString(){
    return 'Recipe{name: $name, image: $images, rating: $rating, totalTime: $totalTime, recipeId: $recipeId,ingredientLines: $ingredientLines,preparationSteps: $preparationSteps}';
  }
}