// lib/models/cake.dart

import 'package:flutter/material.dart';

class CakeList {
  final List<Cake> cakes;

  CakeList({required this.cakes});

 
  factory CakeList.fromJson(List<Map<String, dynamic>> json) {
    List<Cake> cakes = json.map((cakeJson) => Cake.fromJson(cakeJson)).toList();
    return CakeList(cakes: cakes);
  }
}

class Cake {
  final String cakeName; s
  final int price;
  final List<String> imgList;
  final List<CakeDetail>
      cakeDetails; 
  final String description; 
  final List<Ingredient> ingredients;
  final List<String> instructions; 

  Cake({
    required this.cakeName,
    required this.price,
    required this.imgList,
    required this.cakeDetails,
    required this.description,
    required this.ingredients,
    required this.instructions,
  });

  // Factory constructor to create a Cake from JSON
  factory Cake.fromJson(Map<String, dynamic> json) {
    return Cake(
      cakeName: json['cakeName'],
      price: json['price'],
      imgList: List<String>.from(json['imgList']),
      cakeDetails: (json['cakeDetails'] as List)
          .map((detail) => CakeDetail.fromJson(detail))
          .toList(),
      description: json['description'],
      ingredients: (json['ingredients'] as List)
          .map((ingredient) => Ingredient.fromJson(ingredient))
          .toList(),
      instructions: List<String>.from(json['instructions']),
    );
  }
}

class CakeDetail {
  final IconData icon;
  final String text;

  CakeDetail({
    required this.icon,
    required this.text,
  });

  factory CakeDetail.fromJson(Map<String, dynamic> json) {
    return CakeDetail(
      icon: _getIconFromString(json['icon']),
      text: json['text'],
    );
  }

  static IconData _getIconFromString(String iconName) {
  
    switch (iconName) {
      case 'time':
        return Icons.timer;
      case 'difficulty':
        return Icons.trending_up;
      case 'servings':
        return Icons.people;
      default:
        return Icons.info;
    }
  }
}

class Ingredient {
  final String name;
  final String amount;
  final String unit;

  Ingredient({
    required this.name,
    required this.amount,
    required this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      amount: json['amount'],
      unit: json['unit'],
    );
  }
}

// Example usage with sample data:
final sampleCake = {
  'cakeName': 'Vanilla cake',
  'price': 130,
  'imgList': ['assets/cake1.jpg', 'assets/cake2.jpeg', 'assets/cake3.jpeg'],
  'cakeDetails': [
    {'icon': 'time', 'text': '35 minutes'},
    {'icon': 'difficulty', 'text': 'simple'},
    {'icon': 'servings', 'text': 'Serves 8'},
  ],
  'description': 'A vanilla cake.',
  'ingredients': [
    {'name': 'All-purpose flour', 'amount': '2', 'unit': '2 cups'},
    {'name': 'vanilla essence or any', 'amount': '1/4', 'unit': 'half-a-lid'},
    {'name': 'icing - Sugar', 'amount': '2-spoons', 'unit': 'spoons'},
    {'name': 'margerine', 'amount': '250g', 'unit': 'half'},
    {'name': 'eggs', 'amount': '4', 'unit': '4'},
    {'name': 'baking powder', 'amount': '1/2 a teaspoon', 'unit': 'spoon'},
    
  ],
  'instructions': [
    'Preheat oven to 350°F (175°C)',
    'Grease and flour two 9-inch cake pans',
    'Mix dry ingredients in a large bowl',
    'Add wet ingredients and mix until smooth',
    
  ],
};
