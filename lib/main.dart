// lib/main.dart

import 'package:flutter/material.dart';
import 'package:practise_app/model/cake.dart';
import 'model/cake.dart';
import 'screens/cake_list_screen.dart';

void main() {
  // Create the cake instance using your sample data
  final Cake vanillaCake = Cake(
    cakeName: 'Vanilla cake',
    price: 130,
    imgList: ['assets/cake1.jpg', 'assets/cake2.jpeg', 'assets/cake3.jpeg'],
    cakeDetails: [
      CakeDetail(icon: Icons.timer, text: '35 minutes'),
      CakeDetail(icon: Icons.trending_up, text: 'simple'),
      CakeDetail(icon: Icons.people, text: 'Serves 8'),
    ],
    description: 'A vanilla cake.',
    ingredients: [
      Ingredient(name: 'All-purpose flour', amount: '2', unit: '2 cups'),
      Ingredient(
          name: 'vanilla essence or any', amount: '1/4', unit: 'half-a-lid'),
      Ingredient(name: 'icing - Sugar', amount: '2-spoons', unit: 'spoons'),
      Ingredient(name: 'margerine', amount: '250g', unit: 'half'),
      Ingredient(name: 'eggs', amount: '4', unit: '4'),
      Ingredient(
          name: 'baking powder', amount: '1/2 a teaspoon', unit: 'spoon'),
    ],
    instructions: [
      'Preheat oven to 350°F (175°C)',
      'Grease and flour two 9-inch cake pans',
      'Mix dry ingredients in a large bowl',
      'Add wet ingredients and mix until smooth',
    ],
  );

  // Create a list of cakes (you can add more cakes here)
  final List<Cake> cakes = [vanillaCake];

  // Create CakeList instance
  final CakeList cakeList = CakeList(cakes: cakes);

  // Run the app
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Cake Recipe App',
    theme: ThemeData(
      primarySwatch: Colors.pink,
      scaffoldBackgroundColor: Colors.white,
    ),
    home: CakeListScreen(cakeList: cakeList),
  ));
}
