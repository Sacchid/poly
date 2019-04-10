import 'package:poly/poly.dart';

main() {
  int exception_count = 0;
  // Because of Error that List<dynamic> isn't subtype of List<int>
  // So, List a can't be used without casting
  List<num> c1 = [1, 2];
  List<num> w1 = [1, 2, 3];
  List<List<num>> w2 = [
    [1, 2],
    [3, 4]
  ];
  List<List<num>> c2 = [
    [1, 2],
    [3, 4],
    [5, 6]
  ];
  List<List<num>> c3 = [
    c2,
    [
      [7, 8]
    ]
  ].expand((x) => x).toList();
//  print("c3:$c3");

  //  Exception - 1
  ///  NeedsAtLeastThreePoints is thrown if Polygon.points contains less than 3 points
  try {
    Polygon less_than_3 = to_poly_from_list_of_list(w2);
  } on NeedsAtLeastThreePoints catch (e) {
    print("\n");
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 Please provide three or more points. Current number of Points: ${e.currentPointsInPolygon()}");
  }
  // Exception - 2
  ///WrongSizeForPoint is thrown if to_Point has more or less than 2 element. Point has only x and y.
  try {
    var b = to_Point(w1);
  } on WrongSizeForPoint catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 Wrong size, List must have 2 element. Current Size: ${e.inputListLength()}");
  }

//  Exception - 3
  /// _TypeError is thrown if List<dynamic> is passed instead of List<num>  e.g. type 'List<dynamic>' is not a subtype of type 'List<num>'
  try {
    List dy = [1, 2];
    var ttemp = to_Point(dy);
    print(ttemp.runtimeType);
  } on TypeError catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  }

//  Exception - 4
  /// _CastError example - List<num> to List<List<int>>
  try {
    Polygon ooo = to_poly_from_list_of_list(w1.cast());
  } on TypeError catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  } catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} handled : \n \t \u2022 ${e} || ");
  }
//  Correct Error 1
// Error: The argument type 'List<num>' can't be assigned to the parameter type 'List<List<num>>'.
//Polygon ooo = to_poly_from_list_of_list(w1);
}
