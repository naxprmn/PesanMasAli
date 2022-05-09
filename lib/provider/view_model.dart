import 'package:flutter/material.dart';
import 'package:overflow/model/model.dart';
import 'package:overflow/view/shared/global.dart';
import 'package:overflow/view/widget/marker.dart';

class MarkerModel extends ChangeNotifier {
  double _top = 0;
  double _left = 0;
  double _ratio = 1;
  double _constrain = 0.0;
  final double _width = 800;
  List<Widget> _marker = [];

  double get top => _top;
  double get left => _left;
  double get ratio => _ratio;
  double get width => _width;

  List<Ruang> _ruang = Global.ruang.map((e) => Ruang.fromMap(e)).toList();
  List<Ruang> get ruang => _ruang;

  List<Widget> get marker {
    addMarker();
    return _marker;
  }

  getConstrained(double constrained) {
    _constrain = constrained;
  }

  addMarker() {
    _marker.clear();
    print('MAXWIDTH PROVIDER ${_constrain * (_ratio)}');
    for (var item in ruang) {
      _marker.add(Marker().generate(item, _ratio, top, left, width));
    }
  }

  void handlePanUpdate(DragUpdateDetails details) {
    _top = _top + details.delta.dy;
    _left = _left + details.delta.dx;
    notifyListeners();
  }

  void handleZoomIn() {
    _ratio *= 1.5;
    notifyListeners();
  }

  void handleZoomOut() {
    _ratio /= 1.5;
    notifyListeners();
  }
}
