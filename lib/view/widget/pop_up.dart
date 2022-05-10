import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/view_model.dart';

class PopUpCustom {
  buildpopup(context) {
    final model = Provider.of<MarkerModel>(context);

    return Positioned(
      top: model.dy,
      left: model.dx,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blueAccent),
        width: 300,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Expanded(
              child: Row(children: [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: AssetImage(
                    "assets/person/null.png",
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/location/null.jpg",
                      ),
                    ),
                  ),
                ))
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              model.location,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              model.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ]),
        ),
      ),
    );
  }
}
