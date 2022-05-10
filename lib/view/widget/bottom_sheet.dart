import 'package:flutter/material.dart';
import 'package:overflow/model/model.dart';

class BottomSheetCustom {
  buildBottomBar(BuildContext context, Ruang item) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: size.height / 2,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              maxRadius: 100,
                              backgroundImage:
                                  AssetImage("assets/person/null.png"),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(item.name),
                                Text(item.location),
                              ],
                            ))
                          ],
                        ),
                      ),
                      Expanded(child: Image.asset('assets/location/null.png')),
                      const Text('PESAN MASALI'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
