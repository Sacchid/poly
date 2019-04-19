import 'package:poly/poly.dart';

main() {
  int correct_count = 0;
  int exception_count = 0;

  //1. Correct casting
  // * casting `List<dynamic> to `List<num>`
  List correctDynamicList = [1, 2];
  Point correctPointFromDynamicList = toPoint(correctDynamicList.cast<num>());
  print(
      "${++correct_count}. Type of correctPointFromDynamicList is ${correctPointFromDynamicList.runtimeType}, while correctDynamicList was ${correctDynamicList.runtimeType} \t //See casting worked as desired");

  // * casting `List<dynamic>` to `List<List<num>>`
  List correctDynamicListOfList = [
    [1, 2],
    [3, 4]
  ];
  List<Point> listPointFromDynamicList =
      toListOfPoint(correctDynamicListOfList.cast<List<num>>());
  print(
      "${++correct_count}. Type of listPointFromDynamicList is ${listPointFromDynamicList.runtimeType}, while correctDynamicListOfList was ${correctDynamicListOfList.runtimeType} \t //See casting worked as desired");

  // * Using `toListListNum`
  List<List<num>> l = toListListNum([correctDynamicList]);
  print(
      "${++correct_count}. ${l} has type:${l.runtimeType} & has length:${l.length}");

  //  Without casting `List<dynamic>` to `List<num>` `TypeError`is thrown as shown below :
  try {
    List wrongDynamicList = [1, 2];
    var wrongPoint = toPoint(wrongDynamicList);
    print(wrongPoint.runtimeType);
  } on TypeError catch (e) {
    print(
        "\n${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  }

  //  2. Passing `List` instead of `List<List>`
  //  * Passing `List` instead of `List<List>` & casting it : throws `CastError` as shown below :
  //    * type `int` is not a subtype of type `List<num>` in type cast
  try {
    List wrongDynamicList = [1, 2];
    var wrongPoint = toListOfPoint(wrongDynamicList);
    print(wrongPoint.runtimeType);
  } on TypeError catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  }
  //  * Passing `List` instead of `List<List>` but, without casting it : throws `TypeError` as shown below :
  //    * type `List<dynamic>` is not a subtype of type `List<List<num>>`
  try {
    List wrongDynamicList = [1, 2];
    var wrongPoint = toListOfPoint(wrongDynamicList.cast());
    print(wrongPoint.runtimeType);
  } on CastError catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  }
  // type `List<dynamic>` is not a subtype of type `List<num>` in type cast
  try {
    var l = [correctDynamicList];
    print("${l.runtimeType}");
    List<Point> wrongListOfList = toListOfPoint(l.cast());
  } on CastError catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  }

  //type `List<List<dynamic>>` is not a subtype of type `List<List<num>>` in type cast
  try {
    var l = [correctDynamicList] as List<List<num>>;
    print("${l.runtimeType}");
    List<Point> wrongListOfList = toListOfPoint(l.cast());
  } on CastError catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  }

  // * Using from
  // > type `List<dynamic>` is not a subtype of type `List<num>`
  try {
    var l =
        List<List<num>>.from([correctDynamicList].toList() as List<List<num>>)
            .cast()
            .toList();
    print("${l.runtimeType}");
    List<Point> wrongListOfList = toListOfPoint(l.cast());
  } on TypeError catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  } on CastError catch (e) {
    print(
        "${++exception_count}. ${e.runtimeType} Exception handled : \n \t \u2022 ${e}");
  }
}
