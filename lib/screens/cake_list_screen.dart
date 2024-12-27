// lib/screens/cake_list_screen.dart

import 'package:flutter/material.dart';
import '../model/cake.dart';

class CakeListScreen extends StatelessWidget {
  final CakeList cakeList;

  const CakeListScreen({Key? key, required this.cakeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cake Recipes'),
        backgroundColor: Colors.pink[100],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cakeList.cakes.length,
        itemBuilder: (context, index) {
          final cake = cakeList.cakes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CakeDetailScreen(cake: cake),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cake Image
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(cake.imgList[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Cake Information
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cake.cakeName,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${cake.price}',
                          style: TextStyle(
                            color: Colors.pink[400],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          cake.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: Colors.pink[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}

// lib/screens/cake_detail_screen.dart

class CakeDetailScreen extends StatelessWidget {
  final Cake cake;

  const CakeDetailScreen({Key? key, required this.cake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Cake Image and App Bar
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                cake.imgList[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Cake Details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cake.cakeName,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '\$${cake.price}',
                        style: TextStyle(
                          color: Colors.pink[400],
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Cake Details (Time, Difficulty, Servings)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: cake.cakeDetails.map((detail) {
                      return Column(
                        children: [
                          Icon(detail.icon, color: Colors.pink[300]),
                          const SizedBox(height: 4),
                          Text(detail.text),
                        ],
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Ingredients Section
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ...cake.ingredients.map((ingredient) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '• ${ingredient.amount} ${ingredient.unit} ${ingredient.name}',
                      ),
                    );
                  }),

                  const SizedBox(height: 24),

                  // Instructions Section
                  Text(
                    'Instructions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  ...cake.instructions.asMap().entries.map((instruction) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '${instruction.key + 1}. ${instruction.value}',
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
