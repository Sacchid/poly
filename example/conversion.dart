import 'package:poly/poly.dart';

main() {
  int correct_count = 0;
  // Because of Error that List<dynamic> isn't subtype of List<int> :
  // Either use List<num> or cast it to List<num> while passing to argument
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

//  1.1
//  Example of list to Point
  var a = to_Point(c1);
  print("${++correct_count}. to_Point(c1 = [1,2])= $a");

//  2.1
  var n_c = to_list_of_Point(c2);
  print("${++correct_count}. to_list_of_Point(c2 = [1,2], [3,4], [5,6])= $n_c");
  Polygon one = to_poly_from_list_of_list(c2);
  print(
      "${++correct_count}. Is C3= [ C2, [7,8] ] inside Polygon C2 = ${one.getList_IsListOfListInside(c3)}");
  print(
      "${++correct_count}. Are All Points in C3 present inside C2 = ${one.areAllPointsInsidePolygon_List(c3)}");

  // Correct casting
  List correct_dy = [1, 2];
  var correctPointFromDynamicList = to_Point(correct_dy.cast<num>());
  print(
      "${++correct_count}. Type of correctPointFromDynamicList is ${correctPointFromDynamicList.runtimeType} \t //See casting works as desired");

}
