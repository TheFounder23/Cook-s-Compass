import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';



void main() => runApp(Ingredients());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cauliflower Animation',
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Ingredients(),
      ),
    );
  }
}

class Ingredient extends StatefulWidget {
  @override
  _IngredientsState createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredient>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..forward();
    _animation = Tween<double>(begin: 0.0, end: 300.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            'https://ca-times.brightspotcdn.com/dims4/default/beb3e59/2147483647/strip/true/crop/1080x720+0+0/resize/1200x800!/format/webp/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F7a%2F91%2F9581425b41b48d63d61ee506d40f%2Fla-fo-how-to-boil-water-collard-greens.gif',
            fit: BoxFit.cover,
          ),
        ),
        if (_animation.isCompleted)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter Ingredients',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your ingredients here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Search Recipes'),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




void Ing() => runApp(Ingredients());

class Ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<Map<String, dynamic>> dishes = [
    {
      'name': 'Beef Stew',
      'ingredients': ['beef', 'carrots', 'potatoes', 'onion', 'beef broth']
    },
    {
      'name': 'Chicken Alfredo',
      'ingredients': ['chicken', 'fettuccine pasta', 'heavy cream', 'Parmesan cheese', 'garlic', 'butter']
    },
    {
      'name': 'Vegetable Stir-Fry',
      'ingredients': ['mixed vegetables', 'tofu or chicken', 'soy sauce', 'ginger', 'garlic']
    },
    {
      'name': 'Spaghetti Carbonara',
      'ingredients': ['spaghetti pasta', 'bacon', 'eggs', 'Parmesan cheese', 'black pepper', 'garlic']
    },
    {
      'name': 'Fish Tacos',
      'ingredients': ['white fish', 'tortillas', 'coleslaw', 'lime', 'cilantro', 'avocado']
    },
    {
      'name': 'Mushroom Risotto',
      'ingredients': ['Arborio rice', 'mushrooms', 'onion', 'vegetable broth', 'white wine', 'Parmesan cheese']
    },
    {
      'name': 'Pancakes',
      'ingredients': ['flour', 'milk', 'eggs', 'baking powder', 'butter', 'maple syrup']
    },
    {
      'name': 'Spinach and Feta Stuffed Chicken',
      'ingredients': ['chicken breasts', 'spinach', 'feta cheese', 'garlic', 'olive oil', 'breadcrumbs']
    },
    {
      'name': 'Beef Tacos',
      'ingredients': ['ground beef', 'taco seasoning', 'tortillas', 'lettuce', 'tomato', 'cheddar cheese']
    },
    {
      'name': 'Caprese Salad',
      'ingredients': ['tomatoes', 'fresh mozzarella', 'basil leaves', 'balsamic vinegar', 'olive oil']
    },
    {
      'name': 'Shrimp Scampi',
      'ingredients': ['shrimp', 'linguine pasta', 'garlic', 'butter', 'white wine', 'lemon']
    },
    {
      'name': 'Chicken Enchiladas',
      'ingredients': ['cooked chicken', 'tortillas', 'enchilada sauce', 'cheddar cheese', 'onion', 'sour cream']
    },
    {
      'name': 'Beef and Broccoli Stir-Fry',
      'ingredients': ['beef', 'broccoli', 'soy sauce', 'garlic', 'ginger', 'sesame oil']
    },
    {
      'name': 'Lentil Soup',
      'ingredients': ['lentils', 'carrots', 'onion', 'celery', 'vegetable broth', 'spices']
    },
    {
      'name': 'Egg Fried Rice',
      'ingredients': ['rice', 'eggs', 'peas', 'carrots', 'soy sauce', 'green onions']
    },
    {
      'name': 'Roast Chicken',
      'ingredients': ['whole chicken', 'lemon', 'garlic', 'thyme', 'butter', 'potatoes']
    },
    {
      'name': 'Vegetable Lasagna',
      'ingredients': ['lasagna noodles', 'ricotta cheese', 'mozzarella cheese', 'spinach', 'tomato sauce', 'onion']
    },
    {
      'name': 'Beef Burger',
      'ingredients': ['ground beef', 'burger buns', 'lettuce', 'tomato', 'onion', 'cheese']
    },
    {
      'name': 'Stuffed Bell Peppers',
      'ingredients': ['bell peppers', 'ground meat', 'rice', 'tomato sauce', 'onion', 'cheese']
    },
    {
      'name': 'Pesto Pasta',
      'ingredients': ['pasta', 'basil pesto', 'pine nuts', 'Parmesan cheese', 'olive oil', 'garlic']
    }
  ];

  List<String> enteredIngredients = [];

  List<Map<String, dynamic>> filteredDishes = [];

  void filterDishes() {
    filteredDishes = dishes.where((dish) {
      for (String ingredient in enteredIngredients) {
        if (!dish['ingredients'].contains(ingredient)) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  enteredIngredients =
                      value.split(',').map((e) => e.trim()).toList();
                  filterDishes();
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Ingredients',
                hintText: 'e.g. beef, carrots, potatoes',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: filteredDishes.isNotEmpty
                  ? ListView.builder(
                itemCount: filteredDishes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            filteredDishes[index]['name'],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            filteredDishes[index]['ingredients']
                                .join(', '),
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  : Center(
                child: Text(
                  'No dishes found with the entered ingredients.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


