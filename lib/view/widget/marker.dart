import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overflow/view/widget/bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../provider/view_model.dart';

class Marker {
  Widget build(BuildContext context, item) {
    final model = Provider.of<MarkerModel>(context);
    return Positioned(
        left: item.position[0] + model.left,
        top: item.position[1] + model.top,
        child: FractionalTranslation(
            translation: const Offset(-0.5, -0.5),
            child: InkWell(
                onHover: ((value) => model.hoverPopup(item)),
                onTap: () {
                  model.hoverPopup(item);
                  model.openhoverPopup();
                  BottomSheetCustom().buildBottomBar(context, item);
                },
                child: const Icon(
                  FontAwesomeIcons.locationDot,
                  color: Colors.white,
                ))));
  }
}
