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
      "name": "Chicken Curry",
      "ingredients": ["chicken", "onion", "tomatoes", "garlic", "ginger", "spices", "yogurt"]
    },
    {
      "name": "Paneer Tikka",
      "ingredients": ["paneer (cottage cheese)", "bell peppers", "onion", "yogurt", "spices", "lemon juice"]
    },
    {
      "name": "Dal Makhani",
      "ingredients": ["black lentils", "red kidney beans", "butter", "cream", "tomatoes", "spices"]
    },
    {
      "name": "Biryani",
      "ingredients": ["basmati rice", "chicken or mutton", "onion", "spices", "yogurt", "saffron"]
    },
    {
      "name": "Palak Paneer",
      "ingredients": ["paneer (cottage cheese)", "spinach", "onion", "tomatoes", "spices", "cream"]
    },
    {
      "name": "Butter Chicken (Murgh Makhani)",
      "ingredients": ["chicken", "tomatoes", "butter", "cream"]
    },
    {
      "name": "Aloo Gobi",
      "ingredients": ["potatoes", "cauliflower", "onion", "tomatoes", "spices"]
    },
    {
      "name": "Tandoori Chicken",
      "ingredients": ["chicken", "yogurt", "spices", "ginger", "garlic"]
    },
    {
      "name": "Chole Bhature",
      "ingredients": ["chickpeas", "fluffy fried bread", "spices", "onion"]
    },
    {
      "name": "Mutton Rogan Josh",
      "ingredients": ["mutton", "yogurt", "spices", "onion", "tomatoes"]
    },
    {
      "name": "Dosa",
      "ingredients": ["rice and lentil crepe", "potato stuffing", "coconut chutney", "sambar"]
    },
    {
      "name": "Samosa",
      "ingredients": ["fried pastry filled with spiced potatoes", "peas", "spices"]
    },
    {
      "name": "Raita",
      "ingredients": ["yogurt with cucumber", "onion", "spices"]
    },
    {
      "name": "Pakora",
      "ingredients": ["deep-fried fritters", "gram flour", "spices", "vegetables"]
    },
    {
      "name": "Rajma Chawal",
      "ingredients": ["red kidney beans", "rice", "spices", "onion"]
    },
    {
      "name": "Mango Lassi",
      "ingredients": ["yogurt", "mango", "milk", "sugar"]
    },
    {
      "name": "Gulab Jamun",
      "ingredients": ["sweet syrup-soaked dumplings", "milk solids", "sugar", "rose water"]
    },
    {
      "name": "Kofta",
      "ingredients": ["spiced balls", "gravy", "paneer", "vegetables"]
    },
    {
      "name": "Pulao",
      "ingredients": ["rice dish", "spices", "vegetables", "meat"]
    },
    {
      "name": "Tandoori Roti",
      "ingredients": ["oven-baked flatbread", "whole wheat flour"]
    },
    {
      "name": "Hyderabadi Biryani",
      "ingredients": ["basmati rice", "chicken or mutton", "spices", "saffron", "yogurt"]
    },
    {
      "name": "Vada Pav",
      "ingredients": ["spiced potato fritter", "bun", "chutneys"]
    },
    {
      "name": "Rasgulla",
      "ingredients": ["spongy sweet balls", "paneer", "sugar syrup"]
    },
    {
      "name": "Kadhi",
      "ingredients": ["yogurt-based curry", "gram flour", "spices"]
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


