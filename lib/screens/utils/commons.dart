import 'package:flutter/material.dart';

class CommonWidgetUtils {
  static Widget buildCircularImage(String imageUrl, double width) {
    return Container(
        width: width != null ? width : 80,
        height: 90,
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.cover, image: new NetworkImage(imageUrl))));
  }
}
