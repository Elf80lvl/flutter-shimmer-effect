import 'package:flutter/material.dart';

List<Food> allFoods = [
  Food(
      title: 'Apple',
      urlImage:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/red-fresh-apple-isolated-on-white-background-royalty-free-image-1627314996.jpg?crop=1.00xw:0.923xh;0,0.0486xh&resize=768:*',
      description:
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus.'),
  Food(
      title: 'Banana',
      urlImage:
          'https://kot.sh/sites/default/files/styles/large/public/articles-image/25-prost-banana-preview.jpg?itok=fwYNew5Q',
      description:
          'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa.'),
  Food(
      title: 'Kiwi',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Kiwi_%28Actinidia_chinensis%29_2_Luc_Viatour.jpg/800px-Kiwi_%28Actinidia_chinensis%29_2_Luc_Viatour.jpg',
      description:
          'Kiwifruit (often shortened to kiwi in North America and continental Europe) or Chinese gooseberry is the edible berry of several species of woody vines in the genus Actinidia.'),
  Food(
      title: 'Orange',
      urlImage:
          'https://media.istockphoto.com/photos/orange-picture-id185284489?b=1&k=20&m=185284489&s=170667a&w=0&h=a_fCXMop7ZX1V1yoQDYQeIwZTwIei3UjOmmRItszleY=',
      description:
          'An orange is a fruit of various citrus species in the family Rutaceae (see list of plants known as orange)'),
];

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
