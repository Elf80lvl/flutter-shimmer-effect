import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
