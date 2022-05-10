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
  var _context;

  double get top => _top;
  double get left => _left;
  double get ratio => _ratio;
  double get width => _width;
  get context => _context;

  List<Ruang> _ruang = Global.ruang.map((e) => Ruang.fromMap(e)).toList();
  List<Ruang> get ruang => _ruang;
  getContext(context) {
    _context = context;
  }

  getConstrained(double constrained) {
    _constrain = constrained;
  }

  List<Widget> get marker {
    _addMarker();
    return _marker;
  }

  _addMarker() {
    _marker.clear();
    print('MAXWIDTH PROVIDER ${_constrain * (_ratio)}');
    for (var item in ruang) {
      _marker.add(Marker().build(context, item));
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

  bool _isHover = false;
  double _dx = 0.0;
  double _dy = 0.0;
  String _name = "";
  String _location = "";

  bool get ishHover => _isHover;
  double get dx => _dx;
  double get dy => _dy;
  String get name => _name;
  String get location => _location;

  hoverPopup(item) {
    _dy = item.position[0] + top - 150;
    _dx = item.position[1] + left + 10;
    _name = item.name;
    _location = item.location;
    _isHover = !_isHover;
    notifyListeners();
  }
}

// class PopUpModel extends ChangeNotifier {
//   bool _isPopUpClicked = false;
//   var _context;
//   double _dx = 0.0;
//   double _dy = 0.0;

//   bool get isPopUpClicked => _isPopUpClicked;
//   get context => _context;
//   double get dx => _dx;
//   double get dy => _dy;

//   getContext(context) {
//     _context = context;
//   }

//   clickedPopUp(item) {
//     _dx = item.position[0];
//     _dy = item.position[1];

//     print("CHLDREN $item.position[0]");
//     print("CHLDREN $item.position[1]");
//     _isPopUpClicked = !_isPopUpClicked;
//     notifyListeners();
//   }
// }
