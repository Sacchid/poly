/// Library for checking if given point is present in Polygon or not

library poly;

export 'src/poly_base.dart';
export 'dart:math';

import 'dart:math';

//import 'package:json_serializable/json_serializable.dart';
// TODO: Add json support
class Polygon {
  final List<Point<num>> points;

  Polygon(List<Point<num>> points) : points = points.toList(growable: false) {
    if (this.points.length < 3) {
      throw new ArgumentError("Please provide three or more points.");
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
  bool contains_p(Point i) {
    return contains(i.x, i.y);
  }
}
