import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'food.dart';
import 'shimmerWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Shimmer Loading'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  List<Food> foods = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  //*method to load data from server
  Future loadData() async {
    setState(() {
      isLoading = true;
    });
    //to simulate awaiting from server
    await Future.delayed(Duration(seconds: 2), () {});
    foods = List.of(allFoods);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: isLoading ? 4 : foods.length,
        itemBuilder: (context, index) {
          if (isLoading) {
            return buildFoodShimmer();
          } else {
            final food = foods[index];
            return buildFood(food);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: loadData,
      ),
    );
  }

  //*method to create tiles for food (fake data)
  Widget buildFood(Food food) {
    return ListTile(
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(food.urlImage),
      ),
      title: Text(
        food.title,
        style: TextStyle(fontSize: 16),
        maxLines: 1,
      ),
      subtitle: Text(
        food.description,
        style: TextStyle(fontSize: 14),
        maxLines: 1,
      ),
    );
  }

  //*a method to create tiles for shimmer loading
  Widget buildFoodShimmer() {
    return ListTile(
      leading: ShimmerWidget.circular(width: 64, height: 64),
      title: Align(
        //we need alignment here to edit the width of the title otherwise it will take all available space
        alignment: Alignment.centerLeft,
        child: ShimmerWidget.rectangular(
          height: 16,
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
      subtitle: ShimmerWidget.rectangular(height: 14),
    );
  }
}
