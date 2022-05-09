// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:overflow/provider/view_model.dart';
import 'package:overflow/view/widget/background_grid.dart';
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
        model.getConstrained(constraints.maxWidth);
        print('MAXWIDTH ASLI ${constraints.maxWidth * (model.ratio)}');
        List<Widget> marker = model.marker;
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: InteractiveViewer(
            child: GestureDetector(
              onPanUpdate: model.handlePanUpdate,
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
                  // Positioned(
                  //   left: 0,
                  //   top: 0,
                  //   child: Row(
                  //     children: <Widget>[
                  //       IconButton(
                  //         icon: const Icon(Icons.add),
                  //         onPressed: model.handleZoomIn,
                  //       ),
                  //       IconButton(
                  //         icon: const Icon(Icons.remove),
                  //         onPressed: model.handleZoomOut,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
