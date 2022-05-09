import 'package:flutter/material.dart';

class Marker {
  Widget generate(item, double _ratio, top, left, width) {
    return Positioned(
        top: item.position[0] + top,
        left: item.position[1] + left,
        child: InkWell(
            onTap: () {
              print("test");
            },
            child: Column(
              children: [Text(item.name), const Icon(Icons.touch_app_rounded)],
            )));
  }
}
