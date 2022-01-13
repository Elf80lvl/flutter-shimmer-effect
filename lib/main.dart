import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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

  List<Food> allFoods = [
    Food(
        title: 'Apple',
        urlImage:
            'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/red-fresh-apple-isolated-on-white-background-royalty-free-image-1627314996.jpg?crop=1.00xw:0.923xh;0,0.0486xh&resize=768:*',
        description: 'An apple is a edible blablabla'),
    Food(
        title: 'Banana',
        urlImage:
            'https://kot.sh/sites/default/files/styles/large/public/articles-image/25-prost-banana-preview.jpg?itok=fwYNew5Q',
        description: 'Banana ss a banananna'),
    Food(
        title: 'Banana',
        urlImage:
            'https://kot.sh/sites/default/files/styles/large/public/articles-image/25-prost-banana-preview.jpg?itok=fwYNew5Q',
        description: 'Banana ss a banananna'),
    Food(
        title: 'Banana',
        urlImage:
            'https://kot.sh/sites/default/files/styles/large/public/articles-image/25-prost-banana-preview.jpg?itok=fwYNew5Q',
        description: 'Banana ss a banananna'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: isLoading ? 5 : foods.length,
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

//*the actual widget that provides the shimmer effect
class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    this.width = double.infinity,
    required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    //the widget for shimmer effect that comes from the package https://pub.dev/packages/shimmer/install
    return Shimmer.fromColors(
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey,
          shape: shapeBorder,
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      //how long it takes for the animation to execute (optional)
      //period: Duration(seconds: 3),
    );
  }
}

//food class to create list of foods
class Food {
  final String urlImage;
  final String title;
  final String description;

  const Food({
    required this.urlImage,
    required this.title,
    required this.description,
  });
}
