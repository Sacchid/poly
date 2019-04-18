import 'package:poly/poly.dart';

main() {
  int example_count = 0;
  List<Point<num>> l = [
    Point(18.4851825, 73.8498851),
    Point(18.4849214, 73.8498675),
    Point(18.4855965, 73.8520493),
    Point(18.4859711, 73.8512369),
    Point(18.4857828, 73.8500299),
    Point(18.4851825, 73.8498851)
  ];

  /// List of Points can be passed as parameter to constructor Polygon()
  Polygon testPolygon = Polygon(l);
  // Or Just Pass List inside constructor
  Polygon copyOfFirstPolygon = Polygon([
    Point(18.4851825, 73.8498851),
    Point(18.4849214, 73.8498675),
    Point(18.4855965, 73.8520493),
    Point(18.4859711, 73.8512369),
    Point(18.4857828, 73.8500299),
    Point(18.4851825, 73.8498851)
  ]);
  Point in1 = Point(18.48569, 73.85067);

  /// Example of `hasSamePoint()`
  /// *Checks if 2 `Polygon` have same vertices i.e. `points`
  // * Should print `true`
  print(
      "${++example_count}. `testPolygon` and `copyOfFirstPolygon` are same : ${testPolygon.hasSamePoints(copyOfFirstPolygon)}");

  /// A Point can be checked if it's present inside the Polygon by passing [Point i] to isPointInside function
  // Should Print true
  print(
      "${++example_count}. in1=(18.48569, 73.85067) is inside testWyse - ${testPolygon.isPointInside(in1)}");

  /// X,Y can be checked if they are present inside polygon by passing [x,y] to contains function
  // Should Print true
  print(
      "${++example_count}. Polygon a contains :(18.48569, 73.85067) - ${copyOfFirstPolygon.contains(18.48569, 73.85067)}");

  /// Multiple Points inside a List can be tested by passing it to areAllPointsInsidePolygon_ListPoint
  // Should Print true
  print(
      "${++example_count}. All points in l are within testWyse - ${testPolygon.areAllPointsInsidePolygon_ListPoint(l)}");

  ///areAllPointsInsidePolygon_ListPoint returns true if all Point<num> are inside Polygon
  // Should Print false
  List<Point<num>> notInsidePoints = []..addAll(l)..addAll([Point(75, 90)]);
  print(
      "${++example_count}. All points in notInsidePoints are within testWyse - ${testPolygon.areAllPointsInsidePolygon_ListPoint(notInsidePoints)}");
  //  print("${notInsidePoints}, ${notInsidePoints.runtimeType}");

  /// getList_IsListOfPointInside returns List<bool> as List<Point> if List<Point> are inside Polygon
  // Should Print: [true, true, true, true, true, true, false]
  print(
      "${++example_count}. Status of notInsidePoints - ${testPolygon.getList_IsListOfPointInside(notInsidePoints)}");
}
