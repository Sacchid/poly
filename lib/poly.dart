/// Library for checking if given point is present in Polygon or not

library poly;

export 'src/poly_base.dart';
export 'dart:math';

import 'dart:math';
//
/// Appends 2 or 3 Strings - DO not use - problem
//List append(List one, List two){
//  return []..addAll(one)..addAll(two);
//}
//List<Point<num>> new_w = append(l,[Point(74,99)].cast<Point<num>>());
//print("\n\n ${new_w}");
//List<Point<num>> notInsidePoints = append(l,([Point(75,90)] as List<Point<num>>));
//  notInsidePoints = lAppend(l, [Point(75, 99)].cast<Point<num>>(),[Point(45,90)].cast<Point<num>>());

//List lAppend(List one, List two, [List three]) {
//  List _appendedList = (three?.isEmpty ?? false)
//      ? [one, two].expand((x) => x).toList()
//      : [one, two, three].expand((x) => x).toList();
//  return _appendedList;
//}

class NeedsAtLeastThreePoints implements Exception {
  int _number_of_point;
  NeedsAtLeastThreePoints(this._number_of_point);
  String toString() =>
      "Please provide three or more points. Current number of Points: $_number_of_point";
  int currentPointsInPolygon() => this._number_of_point;
}

//TO DO - Check length of dart identifier - Not found
// Is WrongSizeForPoint good enough or should it be length instead of size
// NotJustTwoElementsInList_WrongSizeForPoint
// NotJustTwoElementsForPoint
class WrongSizeForPoint implements Exception {
  int _length_of_list;
  WrongSizeForPoint(this._length_of_list);
  String toString() =>
      "Wrong size, List must have 2 element. Current Size: $_length_of_list";
  int inputListLength() => this._length_of_list;
}
//TODO - Casting ??
// can we check if List<dynamic> is List<num> ?? Replace List<num> with List

/// List<num> to Point
Point to_Point(List<num> list_of_xy) {
  int _length_of_list_xy = list_of_xy.length;
  if (_length_of_list_xy == 2) {
    return Point(list_of_xy[0], list_of_xy[1]);
  } else
    throw WrongSizeForPoint(_length_of_list_xy);
//    return Point(x,y);
}

//TODO - Add a check to see if it's List<List<num>> or just List if it's casted
/// List<List (x,y)> to List<Point>
List<Point<num>> to_list_of_Point(List<List<num>> list_of_list) {
  List<Point<num>> _out_list_of_point = [];
  list_of_list.forEach((_element_in_list_of_list) {
    _out_list_of_point.add(to_Point(_element_in_list_of_list));
  });
  return _out_list_of_point;
}

/// List<List (x,y)> to Polygon
Polygon to_poly_from_list_of_list(List<List<num>> list_of_list) {
  var _length_of_poly = list_of_list.length;
  if (_length_of_poly < 3) {
    throw NeedsAtLeastThreePoints(_length_of_poly);
  }
  List<Point<num>> _list_of_point = [];
  list_of_list.forEach((_element_in_list_of_list) {
    _list_of_point.add(to_Point(_element_in_list_of_list));
  });
  // debug-print
  // print(_list_of_point);
  return Polygon(_list_of_point);
}

//import 'package:json_serializable/json_serializable.dart';
// TODO: Add json support ??
class Polygon {
  final List<Point<num>> points;

  Polygon(List<Point<num>> points) : points = points.toList(growable: false) {
    var _number_of_point = this.points.length;
    if (_number_of_point < 3) {
      throw NeedsAtLeastThreePoints(_number_of_point);
      //  throw new ArgumentError("Please provide three or more points.");
    }
  }

  /// returns 'true' if [x,y] is present inside Polygon
  bool contains(num px, num py) {
    num ax = 0;
    num ay = 0;
    num bx = points[points.length - 1].x - px;
    num by = points[points.length - 1].y - py;
    int depth = 0;

    for (int i = 0; i < points.length; i++) {
      ax = bx;
      ay = by;
      bx = points[i].x - px;
      by = points[i].y - py;

      if (ay < 0 && by < 0) continue; // both "up" or both "down"
      if (ay > 0 && by > 0) continue; // both "up" or both "down"
      if (ax < 0 && bx < 0) continue; // both points on left

      num lx = ax - ay * (bx - ax) / (by - ay);

      if (lx == 0) return true; // point on edge
      if (lx > 0) depth++;
    }

    return (depth & 1) == 1;
  }

  /// returns 'true' if [Point i] is present inside Polygon
  bool isPointInside(Point i) {
    return contains(i.x, i.y);
  }

  /// returns List<bool> from List<Point<num>> based on if Point<num> is present or not
  List<bool> getList_IsListOfPointInside(List<Point<num>> inputListOfPoint) {
    List<bool> _out = [];
    for (var _currentPoint in inputListOfPoint) {
      _out.add(isPointInside(_currentPoint));
    }
    return _out;
  }

  /// returns List<bool> from List<Point<num>> based on if Point<num> is present or not
  List<bool> getList_IsListOfListInside(List<List<num>> inputListOfList) {
    List<bool> _out = [];
    var _inputListOfPoint = to_list_of_Point(inputListOfList);
    _inputListOfPoint.forEach((_currentPoint) {
      _out.add(isPointInside(_currentPoint));
    });
    return _out;
  }

  /// returns true if all Point<num> are inside Polygon
  bool areAllPointsInsidePolygon_ListPoint(List<Point<num>> inputListOfPoint) {
    return getList_IsListOfPointInside(inputListOfPoint).contains(false)
        ? false
        : true;
  }

  /// returns true if all List<num> are inside Polygon
  bool areAllPointsInsidePolygon_List(List<List<num>> inputListOfList) {
    List<Point<num>> inputListOfPoint = to_list_of_Point(inputListOfList);
    return getList_IsListOfPointInside(inputListOfPoint).contains(false)
        ? false
        : true;
  }

  /// returns List indexes from List<Point<num>> based on which Point<num> are present inside
  List<int> listIndexOfInsidePoint(List<Point<num>> inputListOfPoint) {
    List<int> _out = [];
    Point<num> _pointInList;
    for (int index = 0; index < inputListOfPoint.length; index++) {
      _pointInList = inputListOfPoint[index];
      if (isPointInside(_pointInList)) {
        _out.add(index);
      }
    }
    return _out;
  }
}
