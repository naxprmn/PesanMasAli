import 'package:provider/provider.dart';

import '../../provider/view_model.dart';
import '/view/shared/global.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return IgnorePointer(
      ignoring: true,
      child: Container(
        color: Global.white,
        child: Stack(children: [
          Stack(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/map.png',
                width: size.width,
                height: size.height,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              color: Global.blue.withOpacity(0.5),
            ),
          ]),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.touch_app,
                  color: Colors.white,
                  size: 40.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Selamat Datang Di Mas ALI',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Ketuk layar untuk memulai',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
