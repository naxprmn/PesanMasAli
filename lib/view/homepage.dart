// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:overflow/provider/view_model.dart';
import 'package:overflow/view/widget/pop_up.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PESAN MAS ALI"),
      ),
      body: const Center(
        child: Map(),
      ),
    );
  }
}

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final model = Provider.of<MarkerModel>(context);
        // final popUp = Provider.of<PopUpModel>(context);
        model.getContext(context);
        if (kDebugMode) {
          // print('MAXWIDTH ${constraints.maxWidth * (model.ratio)}');
        }
        List<Widget> marker = model.marker;
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: InteractiveViewer(
            child: GestureDetector(
              onPanUpdate: model.handlePanUpdate,
              child: MouseRegion(
                onHover: (event) => model.getOffset(event),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: model.top,
                      left: model.left,
                      width: model.width * (model.ratio),
                      child: Image.asset(
                        "assets/map.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    // CustomPaint(
                    //   painter: BacgroundPaint(),
                    // ),
                    ...marker,
                    model.ishHover
                        ? PopUpCustom().buildpopup(context)
                        : const SizedBox(),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: () {
                              model.resetPosition();
                            },
                          ),
                          // IconButton(
                          //   icon: const Icon(Icons.remove),
                          //   onPressed: model.handleZoomOut,
                          // ),
                        ],
                      ),
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Row(
                        children: <Widget>[
                          Text(
                            "X : ${model.offsetx} , ",
                            textScaleFactor: 3,
                          ),
                          Text(
                            "Y : ${model.offsety}",
                            textScaleFactor: 3,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "LEFT : ${model.left} , ",
                            textScaleFactor: 3,
                          ),
                          Text(
                            "TOP : ${model.top}",
                            textScaleFactor: 3,
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
