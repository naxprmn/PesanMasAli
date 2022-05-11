// ignore_for_file: prefer_final_fields, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:overflow/model/model.dart';
import 'package:overflow/view/shared/global.dart';
import 'package:overflow/view/widget/marker.dart';

class MarkerModel extends ChangeNotifier {
  double _top = 0;
  double _left = 0;
  double _ratio = 1;
  final double _width = 800;
  List<Widget> _marker = [];
  var _context;

  double get top => _top;
  double get left => _left;
  double get ratio => _ratio;
  double get width => _width;

  //converting Ruang to Model
  List<Ruang> _ruang = Global.ruang.map((e) => Ruang.fromMap(e)).toList();
  List<Ruang> get _getruang => _ruang;

  getContext(context) {
    _context = context;
  }

  //Populating every Marker(Setiap Ruangan) in Map
  _addMarker() {
    _marker.clear();
    for (var item in _getruang) {
      _marker.add(Marker().build(_context, item));
    }
  }

  //Displaying Marker after populating it
  List<Widget> get marker {
    _addMarker();
    return _marker;
  }

  //Updating MAP for GestureDetector in HomePage
  void handlePanUpdate(DragUpdateDetails details) {
    _isHover = false;
    _top = _top + details.delta.dy;
    _left = _left + details.delta.dx;
    notifyListeners();
  }

  void resetPosition() {
    _top = 0;
    _left = 0;
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
  double _hoverdxposition = 0.0;
  double _hoverdyposition = 0.0;
  String _name = "";
  String _location = "";
  String _photoPerson = "";
  String _photoLocation = "";

  bool get ishHover => _isHover;
  double get hoverdxpos => _hoverdxposition;
  double get hoverdypos => _hoverdyposition;
  String get name => _name;
  String get location => _location;
  String get photoPerson => _photoPerson;
  String get photoLocation => _photoLocation;

  //passing data to popup container in homePage
  hoverPopup(Ruang item) {
    //item.position[0] = X
    _hoverdxposition = item.position[0] + left - 150;
    //item.position[1] = Y
    _hoverdyposition = item.position[1] + top - 170;
    _name = item.name;
    _location = item.location;
    _photoPerson = item.photoPerson;
    _photoLocation = item.photoLocation;
    _isHover = !_isHover;
    notifyListeners();
  }

  void closehoverPopup() {
    _isHover = false;
    notifyListeners();
  }

  void openhoverPopup() {
    _isHover = true;
    notifyListeners();
  }

  double _offsetx = 0.0, _offsety = 0.0;

  double get offsetx => _offsetx;
  double get offsety => _offsety;

  //debug only / display coordinates in X and Y
  void getOffset(PointerEvent key) {
    _offsetx = key.position.dx;
    _offsety = key.position.dy - 50;
    notifyListeners();
  }
}
