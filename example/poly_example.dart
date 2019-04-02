import 'package:poly/poly.dart';

main() {
  final l = [ Point(18.4851825, 73.8498851),  Point(18.4849214, 73.8498675),  Point(18.4855965, 73.8520493),  Point(18.4859711, 73.8512369),  Point(18.4857828, 73.8500299),  Point(18.4851825, 73.8498851) ];
  /// List of Points can be passed as parameter to constructor Polygon()
  Polygon testWyse = Polygon(l);
  // Or Just Pass List inside constructor
  Polygon a = Polygon([ Point(18.4851825, 73.8498851),  Point(18.4849214, 73.8498675),  Point(18.4855965, 73.8520493),  Point(18.4859711, 73.8512369),  Point(18.4857828, 73.8500299),  Point(18.4851825, 73.8498851) ] );
  Point in1 = Point(18.48569, 73.85067);

  /// A Point can be checked if it's present inside the Polygon by passing [Point i] to contains_p function
  print(testWyse.contains_p(in1));

  /// X,Y can be checked if they are present inside polygon by passing [x,y] to contains function
  print(a.contains(18.48569,73.85067));
}
