A library for checking if given point(s) is present inside Polygon or not.

## Usage
### [1. A  very simple usage example ](example/poly_example.dart "Basic example")
 1. Creates 2 Polygons from `List<Point>`
 2. Prints if given Point is inside Polygon
 3. Prints list of result for List of points if they are inside Polygon or not
 4. Prints if all points in list are inside Polygon or not
* Here `isPointInside(Point( ))`, `contains(x,y)`, `areAllPointsInsidePolygon_ListPoint()` & `areAllPointsInsidePolygon_ListPoint()` used.

### [2. Example of Conversions `List <=> Point`, `List<Point> <=> List<List>` etc.](example/conversion.dart) 
* Along with checking if Points are inside Polygon or not

### [3. Exception Handling Example](example/exception_handling.dart)
1. `NeedsAtLeastThreePoints` is thrown if `Polygon.points` contains less than 3 points
2. `WrongSizeForPoint` is thrown if `to_Point()` has more or less than 2 element. Point has only x and y.
3. **`_TypeError` is thrown if `List<dynamic>` is passed instead of `List<num>`** 
    * Here, casting can be used to cast `List<dynamic>` to `List<num>`
    * e.g. ` print(to_Point([1,2]));` 
      * Here, [1,2] has a type `List<dynamic>`
      * So, use `[1,2].cast<num>()`
4. `_CastError example` - casting `List<num>` to `List<List<num>`


## Function List
##### `List<num>` to `Point(x,y)`
* i.e. `[x,y]`  ->  `Point(x,y)`
* Point can be created passing `List<num>` `to_Point()`.
* List must have exact 2 elements, else will throw `WrongSizeForPoint` exception
##### `List<List<num>>` to `List<Point<num>>`
* i.e. `[ [x1,y1],[x2,y2],... ]`  ->  `[ Point(x1,y1), Point(x2,y2),... ]`
* List of Points can be created from `List<List<num>>` by passing it to `to_list_of_Point()`
##### Check if Multiple Points are inside given Polygon
 ###### Get Status of each Point
* `getList_IsListOfListInside(List<List<num>>)` returns `List<bool>` 
* `getList_IsListOfPointInside(List<Point<num>>)` returns `List<bool>` 
 ###### Check if all given Points are inside given Polygon
* `areAllPointsInsidePolygon_List((List<List<num>>)` returns `true` or `false`
* `areAllPointsInsidePolygon_ListPoint(List<Point<num>>)` returns `true` or `false`



## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/Sacchid/poly/issues

## Licence & Original Author links 
Implemented contains function logic from [StageXL - A fast and universal 2D rendering engine for HTML5 and Dart](https://github.com/bp74/StageXL) 

As, StageXL imports `'dart:html'`, it can not be used in [console application](https://www.dartlang.org/tutorials/server/cmdline) or in [aqueduct back-end](https://aqueduct.io/).

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).


