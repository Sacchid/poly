import 'package:poly/poly.dart';

main() {
  int correct_count = 0;
  int exception_count = 0;
  List correctDynamicList = [1, 2, 'a'];
  // listOf is `List<dynamic>
  List listOf = [
    [1, true],
    [2, 'Remove me'],
    [3, 4],
    [5, 6],
    [7, 8]
  ];
//  // * Using `toListListNum`
//  List<List<num>> l = toListListNum([correctDynamicList]);
//  print(
//      "${++correct_count}. Using `toListListNum`,${l} has type:${l.runtimeType} & has length:${l.length}");

  print(
      "\u2022 Old List:${listOf} has type:${listOf.runtimeType} & has length:${listOf.length}");

  List<List<num>> m = toListListNum(listOf);
  print(
      "${++correct_count}. Using `toListListNum`,${m} has type:${m.runtimeType} & has length:${m.length}");

  List<List<num>> m_zero = toListListNum(listOf, replaceWithZero: true);
  print(
      "${++correct_count}. Using `toListListNum` with replaceWithZero: true,${m_zero} has type:${m_zero.runtimeType} & has length:${m_zero.length}");
}
