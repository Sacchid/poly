/// Library for checking if given point is present in Polygon or not

library poly;

export 'dart:math' show Point;

import 'dart:math' show Point, asin, sqrt, pow, sin, cos, pi;
import 'package:csv/csv.dart';
import 'dart:convert' show utf8;
import 'package:collection/collection.dart' as check_list
    show DeepCollectionEquality;

// Appends 2 or 3 Strings - DO not use - problem

// TO DO - open issue on dart-lang : casting doesn't work - Check with dartpad & for List<num>
// Done
// for `List<List<num>> c3 = listAppend(c2, [[7,8]].cast() );`
// Getting following exception
// Unhandled exception:
//type 'List<dynamic>' is not a subtype of type 'List<List<num>>'
//#0      main (file:///E:/dart/poly/example/conversion.dart:14:19)
//#1      _startIsolate.<anonymous closure> (dart:isolate/runtime/libisolate_patch.dart:300:19)
//#2      _RawReceivePortImpl._handleMessage (dart:isolate/runtime/libisolate_patch.dart:171:12)
List listAppend(List one, List two) {
  return []..addAll(one)..addAll(two);
}
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
//TO DO - Add YX to XY - done in list
//TODO - kml support
///* `NeedsAtLeastThreePoints` is thrown if `Polygon.points` contains less than 3 points
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
///* `WrongSizeForPoint` is thrown if `to_Point()` has more or less than 2 element. Point has only x and y.
class WrongSizeForPoint implements Exception {
  int _length_of_list;
  WrongSizeForPoint(this._length_of_list);
  String toString() =>
      "Wrong size, List must have 2 element. Current Size: $_length_of_list";
  int inputListLength() => this._length_of_list;
}

//TO DO - Casting ??
// can we check if List<dynamic> is List<num> ?? Replace List<num> with List
///* returns `true` if `String` contains Space
bool containsSpace(String inputString) {
  return inputString.contains(" ");
}

/// `List<num>` to `Point`
Point toPoint(List<num> list_of_xy) {
  int _length_of_list_xy = list_of_xy.length;
  if (_length_of_list_xy == 2) {
    return Point(list_of_xy[0], list_of_xy[1]);
  } else {
    throw WrongSizeForPoint(_length_of_list_xy);
  }
//    return Point(x,y);
}

///  `Point` to `List<num>`
List<num> pointToList(Point inPoint) {
  List<num> output = [inPoint.x, inPoint.y];
  return output;
}

//TODO - Add a check to see if it's List<List<num>> or just List if it's casted ?
/// `List<List (x,y)>` to `List<Point>`
List<Point<num>> toListOfPoint(List<List<num>> list_of_list) {
  List<Point<num>> _out_list_of_point = [];
  list_of_list.forEach((_element_in_list_of_list) {
    _out_list_of_point.add(toPoint(_element_in_list_of_list));
  });
  return _out_list_of_point;
}

/// `List<Point>` to `List<List (x,y)>`
List<List<num>> pointsToList(List<Point<num>> inputListOfPoint) {
  List<List<num>> _out = [];
  for (int _i = 0; _i < inputListOfPoint.length; _i++) {
    _out.add(pointToList(inputListOfPoint[_i]));
  }
  return _out;
}

/// `List<List (x,y)>` to `Polygon`
Polygon toPolyFromListOfList(List<List<num>> list_of_list) {
  var _length_of_poly = list_of_list.length;
  if (_length_of_poly < 3) {
    throw NeedsAtLeastThreePoints(_length_of_poly);
  }
  List<Point<num>> _list_of_point = [];
  list_of_list.forEach((_element_in_list_of_list) {
    _list_of_point.add(toPoint(_element_in_list_of_list));
  });
  // debug-print
  // print(_list_of_point);
  return Polygon(_list_of_point);
}

/// Returns `List<num>` from a `List<dynamic>`
/// * Can be used with [toPoly] as it accepts `List<num>`
/// * Optional Parameters -
///   * `sizeTwo`
///     - Default value `true`
///     - When set `false`, `Output List` can have more than 2 elements
///   * `replaceWithZero`
///     - Default value `false`
///     - When set `true`, elements with type `String` or `bool` will be replaced with 0, rather than being removed
///   * `reverseIt`
///     - Default value `false`
///     - When set `true`, `List` will be reversed
List<num> toListNum(List _inputList,
    {bool reverseIt = false,
    bool replaceWithZero = false,
    bool sizeTwo = true}) {
  var _list = []..addAll(_inputList);
  int lengthOfPoints = _list.length;
  if (replaceWithZero) {
    //print("${lengthOfPoints}");
    if (sizeTwo) {
      if (lengthOfPoints < 2) {
        _list = [0, 0];
      }
      var x = _list[0];
      var y = _list[1];
      //print(x.runtimeType);
      if (((x.runtimeType == String) || (x.runtimeType == bool)) &&
          ((y.runtimeType == String) || (y.runtimeType == bool))) {
        _list = [0, 0];
      } else if ((x.runtimeType == String) || (x.runtimeType == bool)) {
        _list = [0, y];
      } else if ((y.runtimeType == String) || (y.runtimeType == bool)) {
        _list = [x, 0];
      }
    } else {
      for (int _i = 0; _i < lengthOfPoints; _i++) {
        var element = _list[_i];
        if ((element.runtimeType == String) || (element.runtimeType == bool)) {
          _list[_i] = 0;
        }
      }
    }
  } else {
    _list.removeWhere(
        (_i) => (((_i.runtimeType == String) || (_i.runtimeType == bool))));
  }

  lengthOfPoints = sizeTwo ? 2 : _list.length;

  //print("${lengthOfPoints}");
  List<num> numList = [];
  if (reverseIt) {
    for (int _i = lengthOfPoints - 1; _i >= 0; _i--) {
      var x = _list[_i];
      //print(x.runtimeType);
      numList.add(x);
    }
  } else {
    for (int _i = 0; _i < lengthOfPoints; _i++) {
      var x = _list[_i];
      //print(x.runtimeType);
      numList.add(x);
    }
  }
  return numList;
}

/// Returns `List<List<num>>` from a `List<List<dynamic>>`
/// * Can be used with functions like [areAllPointsInsidePolygon_List] , [getList_IsListOfListInside] , [toPolyFromListOfList] , [toListOfPoint]  which accepts `List<List<num>>`
/// * Optional Parameters -
///   * `replaceWithZero`
///     - Default value `false`
///     - When set `true`, elements with type `String` or `bool` will be replaced with 0, rather than being removed
///   * `swapXAndY`
///     - Default value `false`
///     - When set `true`, `xi` will be swapped with `yi`
///       - i.e. `[ [x1,y1], [x2,y2], ...]` -> `[ [y1,x1], [y2,x2], ...]`
List<List<num>> toListListNum(List _inputListOfList,
    {bool swapXAndY = false, bool replaceWithZero = false}) {
  var _listOfList = []..addAll(_inputListOfList);
  if (_listOfList[0][0].runtimeType == String) {
    swapXAndY = swapXAndY
        ? swapXAndY
        : ((_listOfList[0][0] == "longitude" || _listOfList[0][0] == "y")
            ? true
            : false);
    //_listOfList.removeAt(0);
  }
  int lengthOfPoints = _listOfList.length;
  //print("Before: ${lengthOfPoints}");
  if (replaceWithZero) {
    //print("${lengthOfPoints}");
    for (int _i = 0; _i < lengthOfPoints; _i++) {
      var x = _listOfList[_i][0];
      var y = _listOfList[_i][1];
      //print(x.runtimeType);
      if (((x.runtimeType == String) || (x.runtimeType == bool)) &&
          ((y.runtimeType == String) || (y.runtimeType == bool))) {
        _listOfList[_i] = [0, 0];
      } else if ((x.runtimeType == String) || (x.runtimeType == bool)) {
        _listOfList[_i] = [0, y];
      } else if ((y.runtimeType == String) || (y.runtimeType == bool)) {
        _listOfList[_i] = [x, 0];
      }
      // print("${lengthOfPoints}");
    }
  } else {
    _listOfList.removeWhere((_i) =>
        (((_i[0].runtimeType == String) || (_i[0].runtimeType == bool)) ||
            ((_i[1].runtimeType == String) || (_i[1].runtimeType == bool))));
  }
  lengthOfPoints = _listOfList.length;
  List<List<num>> numList = [];

  if (swapXAndY) {
    for (int _i = 0; _i < lengthOfPoints; _i++) {
      var x = _listOfList[_i][0];
      var y = _listOfList[_i][1];
      numList.add([y, x]);
      //print(x.runtimeType);
//      if ((x.runtimeType == String) || (y.runtimeType == String) ) {
//        _listOfList.removeAt(_i);
//        --lengthOfPoints;
//      }
//      else{
//        numList.add([y, x]);
//      }
    }
  } else {
    //print("lengthOfPoints:${lengthOfPoints}");
    for (int _i = 0; _i < lengthOfPoints; _i++) {
      // print("_i:${_i}");
      var y = _listOfList[_i][1];
      var x = _listOfList[_i][0];
      numList.add([x, y]);
      //print(x.runtimeType);
//      if ((x.runtimeType == String) || (y.runtimeType == String) ) {
//        _listOfList.removeAt(_i);
//        --lengthOfPoints;
//      }
//      else{
//        numList.add([x, y]);
//      }
    }
  }
  return numList;
}

//import 'package:json_serializable/json_serializable.dart';
// TODO: Add json support ??
// TODO: Polygon Name ??

/// A class for representing two-dimensional Polygon defined with `List<Point<num>> points`.
class Polygon {
  final List<Point<num>> points;
  String name;
  // double version;

  ///Create a `Polygon` with vertices at `points`.
  /// Pass a `List<Point<num>>`
  Polygon(List<Point<num>> points) : points = points.toList(growable: false) {
    var _number_of_point = this.points.length;
    if (_number_of_point < 3) {
      throw NeedsAtLeastThreePoints(_number_of_point);
      //  throw new ArgumentError("Please provide three or more points.");
    }
//    name = tname;
  }

  /// returns `List<List<num>>`
  List<List<num>> listOfList() {
    return pointsToList(points);
  }

  /// returns `true` if `(x,y)` is present inside `Polygon`
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

  /// Calculates distance between two points {lat1,lon1} and {lat2,lon2} in meter
  /// source - https://edwilliams.org/avform.htm#Dist
  /// TODO add examples & tests
  double distanceInMeter(double lat1, double lon1, double lat2, double lon2) {
    double d;
    // d in rad
    d = 2 *
        asin(sqrt((pow((sin((lat1 - lat2) / 2)), 2)) +
            cos(lat1) * cos(lat2) * (pow((sin((lon1 - lon2) / 2)), 2))));
    // d in nm
    d = d * 180 * 60 / pi;
    // d in m
    d = d * 1852;
    return d;
  }

  /// Checks if `Point i` is inside Polygon with tolerance of T meter
  /// TODO add examples & tests
  // The following function is not completely optimized yet
  bool isPointInsideT(Point i, double T) {
    if (isPointInside(i)) {
      return true;
    } else {
      double dis = 0, dd = 0;
      dis = distanceInMeter(i.x, i.y, points[0].x, points[0].y);
      for (int j = 1; j < points.length; j++) {
        dd = distanceInMeter(i.x, i.y, points[j].x, points[j].y);
        dis = dd < dis ? dd : dis;
      }
      return dis > T ? false : true;
    }
  }

  /// Checks if 2 `Polygon` have same vertices i.e. `points`
  bool hasSamePoints(Polygon anotherPolygon) {
    bool same = (points.length == anotherPolygon.points.length);
    if (!same) {
      return false;
    } else {
//      int _length = points.length;
      Function deepEq =
          const check_list.DeepCollectionEquality.unordered().equals;
      return deepEq(points, anotherPolygon.points);
    }
  }

  /// returns `true` if `Point` is present inside `Polygon`
  bool isPointInside(Point i) {
    return contains(i.x, i.y);
  }

  /// returns `List<bool>` from `List<Point<num>>` based on if `Point<num>` is present or not
  List<bool> getList_IsListOfPointInside(List<Point<num>> inputListOfPoint) {
    List<bool> _out = [];
    for (var _currentPoint in inputListOfPoint) {
      _out.add(isPointInside(_currentPoint));
    }
    return _out;
  }

  /// returns `List<bool>` from `List<Point<num>>` based on if `Point<num>` is present or not
  List<bool> getList_IsListOfListInside(List<List<num>> inputListOfList) {
    List<bool> _out = [];
    var _inputListOfPoint = toListOfPoint(inputListOfList);
    _inputListOfPoint.forEach((_currentPoint) {
      _out.add(isPointInside(_currentPoint));
    });
    return _out;
  }

  /// returns `true` if all `Point<num>` are inside `Polygon`
  bool areAllPointsInsidePolygon_ListPoint(List<Point<num>> inputListOfPoint) {
    return getList_IsListOfPointInside(inputListOfPoint).contains(false)
        ? false
        : true;
  }

  /// returns `true` if all List<num> are inside `Polygon`
  bool areAllPointsInsidePolygon_List(List<List<num>> inputListOfList) {
    List<Point<num>> inputListOfPoint = toListOfPoint(inputListOfList);
    return getList_IsListOfPointInside(inputListOfPoint).contains(false)
        ? false
        : true;
  }

  /// returns `List indexes` from `List<Point<num>>` based on which `Point<num>` are present inside
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

  /// * Returns result of `ArePointsInside` as CSV String which can be later saved or displayed
  /// * Output CSV String will by default contain a header row - `latitude,longitude,isInside`
  /// * Optional Named parameter: `bool useXY`
  ///    * By passing, optional parameter: `useXY` as true, header will be `x,y` instead of `latitude,longitude`
  ///    * Default value of `useXY` is `false`
  /// * Optional Named parameter: `String includeHeader`
  ///    * if optional parameter - `includeHeader` is passed as `false`, returning String will not contain header row
  /// * Optional Named parameter: `String diffNameThanIsInside`
  ///    * Different name than Default name(`isInside`) will be used by passing optional parameter: `diffNameThanIsInside`
  String IsInsideResultWithXY_ToCSVString(List<Point<num>> inputListOfPoint,
      {bool includeHeader = true,
      String diffNameThanIsInside,
      bool useXY = false}) {
    List<List> xYOut = [];
    if (includeHeader) {
      String headerX = useXY ? "x" : "latitude";
      String headerY = useXY ? "y" : "longitude";
      // TODO - Remove three quotation marks """Example Name_with_space""" when '"x"' is used, instead of "x"
      diffNameThanIsInside = containsSpace(diffNameThanIsInside)
          ? '${diffNameThanIsInside}'
          : diffNameThanIsInside;
//      print(diffNameThanIsInside);
      String headerIs = (diffNameThanIsInside?.isNotEmpty ?? false)
          ? diffNameThanIsInside
          : "isInside";
      var headerL = [headerX, headerY, headerIs];
      xYOut.add(headerL);
    }

    for (var _currentPoint in inputListOfPoint) {
      bool c_out = isPointInside(_currentPoint);
//      _out.add(c_out);
//      x.add(_currentPoint.x);
//      y.add(_currentPoint.y);
      var Temp = [_currentPoint.x, _currentPoint.y, c_out];
      xYOut.add(Temp);
    }
    String csv = const ListToCsvConverter().convert(xYOut);
    return csv;
  }

  /// * Returns `Polygon` as CSV String which can be later saved or displayed
  /// * Output CSV String will by default contain a header row - `latitude,longitude`
  /// * Optional Named parameter: `bool useXY`
  ///    * By passing, optional parameter: `useXY` as true, header will be `x,y` instead of `latitude,longitude`
  ///    * Default value of `useXY` is `false`
  /// * Optional Named parameter: `String includeHeader`
  ///    * if optional parameter - `includeHeader` is is passed as `false`, returning String will not contain header row
  String toCSVString({bool includeHeader = true, bool useXY = false}) {
    List<List> _xY = [];
    if (includeHeader) {
      String _headerX = useXY ? "x" : "latitude";
      String _headerY = useXY ? "y" : "longitude";
      var _headerL = [_headerX, _headerY];
      _xY.add(_headerL);
    }
    for (var _currentPoint in points) {
      var _currentXY = [_currentPoint.x, _currentPoint.y];
      _xY.add(_currentXY);
    }
    String csv = const ListToCsvConverter().convert(_xY);
    return csv;
  }
} // class Polygon

/// * Returns `Future<List<List>>` based on `csvString`
///    * which then can be used - convert that list into `Polygon`
/// * Optional parameter: `bool noHeader`
///     * By passing optional parameter: `noHeader` as `true`, Resulting List will not contain header row
///     * Default value `false`
Future<List<List>> csvToListOfList(var csvString,
    {bool noHeader = false}) async {
  final List<List> listOfList = await csvString
      .transform(utf8.decoder)
      .transform(CsvToListConverter())
      .toList();
  if (noHeader) {
    listOfList.removeAt(0);
  }
  return listOfList;
}

/// * Returns `Future<Polygon>` based on `csvString`
/// * `csvString` may or may not contain header row
/// * This function checks if `latitude,longitude` or `x,y` are reversed
///     * By checking Header row label
///     * i.e. By checking 1st row 1st element is neither "longitude" or "y"
///   * If they are reversed, Returned `Polygon` will be `Polygon(latitude,longitude)`, instead of `Polygon(longitude,latitude)`
///   * This can be manually set by passing optional parameter: `isReversed` as `true`
/// * Optional parameter: `isReversed`
///     * `isReversed` has default value = `false`
Future<Polygon> csvToPoly(var csvString, {bool isReversed = false}) async {
  List<List> _listOfList = await csvString
      .transform(utf8.decoder)
      .transform(CsvToListConverter())
      .toList();
  if (_listOfList[0][0].runtimeType == String) {
    isReversed = isReversed
        ? isReversed
        : ((_listOfList[0][0] == "longitude" || _listOfList[0][0] == "y")
            ? true
            : false);
    _listOfList.removeAt(0);
  }

  List<List<num>> numList = [];
  int lengthOfPoints = _listOfList.length;
  if (isReversed) {
    for (int _i = 0; _i < lengthOfPoints; _i++) {
      var x = _listOfList[_i][0];
      var y = _listOfList[_i][1];
      //print(x.runtimeType);
      numList.add([y, x]);
    }
  } else {
    for (int _i = 0; _i < lengthOfPoints; _i++) {
      var y = _listOfList[_i][1];
      var x = _listOfList[_i][0];
      //print(x.runtimeType);
      numList.add([x, y]);
    }
  }
  Polygon _out = toPolyFromListOfList(numList);
  return _out;
}

//Future<Polygon> csvToPoly_casting_issue(var input, {bool isReversed = false}) async {
//  List<List<num>> fields = await input
//      .transform(utf8.decoder)
//      .transform(new CsvToListConverter())
//      .toList();
//  if (fields[0][0].runtimeType == String) {
//    fields.removeAt(0);
//  }
//  final List<List<num>> numList = fields.cast<List<num>>();
//  List<List<num>> rever = [];
//  for (int i = 0; i < numList.length; i++) {
//    num x = numList[i][1].toDouble();
//    num y = numList[i][0].toDouble();
//    rever.add([x, y]);
//  }
//  Polygon _out = to_poly_from_list_of_list(numList);
//  return _out;
//}
////WOrks - type double
//Future<void> csvToTemp(var input, {bool isReversed = false}) async {
//  List<List> fields = await input
//      .transform(utf8.decoder)
//      .transform(new CsvToListConverter())
//      .toList();
//  if (fields[0][0].runtimeType == String) {
//    fields.removeAt(0);
//  }
////  final List<List<num>> numList = fields.cast<List<num>>();
//
//  List<List<num>> rever = [];
//  for (int i = 0; i <fields.length; i++) {
//    var x = fields[i][1];
//    var y = fields[i][0];
//    print(x.runtimeType);
//    rever.add([x, y]);
//  }
////  return x;
////  Polygon _out = to_poly_from_list_of_list(rever);
////  return _out;
//}
