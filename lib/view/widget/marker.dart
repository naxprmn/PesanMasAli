import 'package:flutter/material.dart';
import 'package:overflow/view/widget/bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../provider/view_model.dart';

class Marker {
  Widget build(BuildContext context, item) {
    final model = Provider.of<MarkerModel>(context);
    return Positioned(
        top: item.position[0] + model.top,
        left: item.position[1] + model.left,
        child: InkWell(
            onHover: ((_) {
              model.hoverPopup(item);
            }),
            onTap: () {
              BottomSheetCustom().buildBottomBar(context, item);
            },
            child: Column(
              children: [Text(item.name), const Icon(Icons.touch_app_rounded)],
            )));
  }
}
