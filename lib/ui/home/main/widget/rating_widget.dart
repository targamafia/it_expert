import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({Key? key, required this.n}) : super(key: key);
  final int n;

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    List<Icon> stars = [];
    for (var i = 0; i < widget.n; i++) {
      stars.add(
        const Icon(
          Icons.star,
          color: Colors.amberAccent,
        ),
      );
    }
    return Row(
      children: stars,
    );
  }
}
