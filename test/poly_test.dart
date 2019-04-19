import 'package:poly/poly.dart';

import "package:test/test.dart";

void main() {
  group("Simple Poly test: ", (){
    List<Point<num>> l = [
      Point(18.4851825, 73.8498851),
      Point(18.4849214, 73.8498675),
      Point(18.4855965, 73.8520493),
      Point(18.4859711, 73.8512369),
      Point(18.4857828, 73.8500299),
      Point(18.4851825, 73.8498851)
    ];
    Polygon testPolygon = Polygon(l);
    Polygon copyOfFirstPolygon = Polygon([
      Point(18.4851825, 73.8498851),
      Point(18.4849214, 73.8498675),
      Point(18.4855965, 73.8520493),
      Point(18.4859711, 73.8512369),
      Point(18.4857828, 73.8500299),
      Point(18.4851825, 73.8498851)
    ]);
    Point in1 = Point(18.48569, 73.85067);
    test("`hasSamePoint()`",(){
      bool areTwoSame = testPolygon.hasSamePoints(copyOfFirstPolygon);
      expect(areTwoSame,equals(true));
    });
    test("`isPointInside` ",(){
      bool isIn1InsideTestPolygon = testPolygon.isPointInside(in1);
      expect(isIn1InsideTestPolygon,equals(true));
    });
    test("`isPointInside` ",(){
      bool polygonContain = copyOfFirstPolygon.contains(18.48569, 73.85067);
      expect(polygonContain,equals(true));
    });
    test(" areAllPointsInsidePolygon_ListPoint : true ", () {
      bool areAllInside = testPolygon.areAllPointsInsidePolygon_ListPoint(l);
      expect(areAllInside,equals(true));
    });
    test(" areAllPointsInsidePolygon_ListPoint : false  ", () {
      List<Point<num>> notInsidePoints = []..addAll(l)..addAll([Point(75, 90)]);
      bool areAllInside = testPolygon.areAllPointsInsidePolygon_ListPoint(notInsidePoints);
      expect(areAllInside,equals(false));
    });
    test(" getList_IsListOfPointInside  ", () {
      List<Point<num>> notInsidePoints = []..addAll(l)..addAll([Point(75, 90)]);
      List<bool> statusOfPoints = testPolygon.getList_IsListOfPointInside(notInsidePoints);
      expect(statusOfPoints,equals([true, true, true, true, true, true, false]));
    });
  });

  group("Dynamic to num: ", (){
    List correctDynamicList = [1, 2, 'a', 3];
    List listOf = [
      [1, true],
      [2, 'Remove me'],
      [3, 4],
      [5, 6],
      [7, 8]
    ];
    test("Old list Type:",(){
      var oldType = correctDynamicList.runtimeType.toString();
      expect(oldType,equals("List<dynamic>"));
    });
    test("Old list Length:",(){
      var oldType = correctDynamicList.length;
      expect(oldType,equals(4));
    });

  });
}
