import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/view_model.dart';

class PopUpCustom {
  buildpopup(context) {
    final model = Provider.of<MarkerModel>(context);

    return Positioned(
      top: model.hoverdypos,
      left: model.hoverdxpos,
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
                    model.photoPerson,
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        model.photoLocation,
                      ),
                    ),
                  ),
                ))
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.location,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              model.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ]),
        ),
      ),
    );
  }
}
