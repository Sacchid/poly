import 'package:poly/poly.dart';

main() {
  var exception_count = 0;
  // Because of Error that List<dynamic> isn't subtype of List<int>
  // So, List a can't be used without casting
  var w1 = <num>[1, 2, 3];
  var w2 = <List<num>>[
    [1, 2],
    [3, 4]
  ];
  var c2 = <List<num>>[
    [1, 2],
    [3, 4],
    [5, 6]
  ];

  //  Exception - 1
  ///  NeedsAtLeastThreePoints is thrown if Polygon.points contains less than 3 points
  try {
    var less_than_3 = toPolyFromListOfList(w2);
  } on NeedsAtLeastThreePoints catch (e) {
    print('\n');
    print(
        '${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 Please provide three or more points. Current number of Points: ${e.currentPointsInPolygon()}');
  }
  // Exception - 2
  ///WrongSizeForPoint is thrown if to_Point has more or less than 2 element. Point has only x and y.
  try {
    var pointWithMoreThanXY = toPoint(w1);
  } on WrongSizeForPoint catch (e) {
    print(
        '${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 Wrong size, List must have 2 element. Current Size: ${e.inputListLength()}');
  }

//  Exception - 3
  /// `TypeError` is thrown if `List<dynamic>` is passed instead of `List<num>`
  /// e.g. type 'List<dynamic>' is not a subtype of type 'List<num>'
  try {
    var dy = [1, 2];
    var ttemp = toPoint(dy as List<num>);
    print(ttemp.runtimeType);
  } on TypeError catch (e) {
    print(
        '${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 $e');
  }

//  Exception - 4
  /// `CastError` example - List<num> to List<List<int>>
  try {
    var wrongPoly = toPolyFromListOfList(w1.cast());
  } on TypeError catch (e) {
    print(
        '${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 $e');
  } catch (e) {
    print(
        '${++exception_count}. ${e.runtimeType} handled : \n \t \u2022 $e || ');
  }
//  Correct Error 1
// Error: The argument type 'List<num>' can't be assigned to the parameter type 'List<List<num>>'.
//Polygon ooo = to_poly_from_list_of_list(w1);
}
