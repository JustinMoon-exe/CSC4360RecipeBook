import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Recipe Book',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        brightness: Brightness.light,
      ),
      home: HomeScreen(),
    );
  }
}

class Recipe {
  final String name;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Chicken Alfredo',
      ingredients: ['Fettuccine', 'Chicken breast', 'Heavy cream', 'Parmesan cheese', 'Garlic', 'Butter'],
      instructions: ['Cook pasta', 'Cook chicken', 'Make Alfredo sauce', 'Combine all ingredients'],
    ),
    Recipe(
      name: 'Kerala Chicken Curry',
      ingredients: ['Chicken', 'Coconut milk', 'Onions', 'Tomatoes', 'Spices', 'Curry leaves'],
      instructions: ['Marinate chicken', 'Prepare curry base', 'Cook chicken in curry', 'Simmer until done'],
    ),
    Recipe(
      name: 'Smashburgers',
      ingredients: ['Ground beef', 'Cheese slices', 'Burger buns', 'Salt', 'Pepper', 'Butter'],
      instructions: ['Form beef balls', 'Smash on hot griddle', 'Flip and add cheese', 'Serve on toasted buns'],
    ),
    Recipe(
      name: 'Carbonara',
      ingredients: ['Spaghetti', 'Pancetta', 'Eggs', 'Pecorino cheese', 'Black pepper'],
      instructions: ['Cook pasta', 'Fry pancetta', 'Mix eggs and cheese', 'Combine all ingredients'],
    ),
    Recipe(
      name: 'Bulgogi',
      ingredients: ['Thinly sliced beef', 'Soy sauce', 'Sugar', 'Sesame oil', 'Garlic', 'Green onions'],
      instructions: ['Marinate beef', 'Prepare vegetables', 'Grill or pan-fry beef', 'Serve with rice'],
    ),
    Recipe(
      name: 'Braised Pork Belly',
      ingredients: ['Pork belly', 'Soy sauce', 'Brown sugar', 'Ginger', 'Garlic', 'Star anise'],
      instructions: ['Brown pork belly', 'Add braising liquid', 'Simmer for hours', 'Reduce sauce and serve'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Recipe Book'),
      ),
      child: SafeArea(
        child: ListView.separated(
          itemCount: recipes.length,
          separatorBuilder: (context, index) => Divider(height: 1),
          itemBuilder: (context, index) {
            return CupertinoListTile(
              title: Text(recipes[index].name),
              trailing: CupertinoListTileChevron(),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => DetailsScreen(recipe: recipes[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(recipe.name),
      ),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...recipe.ingredients.map((ingredient) => Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text('• $ingredient'),
            )),
            SizedBox(height: 16),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...recipe.instructions.map((instruction) => Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(instruction),
            )),
          ],
        ),
      ),
    );
  }
}