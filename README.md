A library for checking if given point(s) is present inside Polygon or not.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

Implemented logic from [StageXL - A fast and universal 2D rendering engine for HTML5 and Dart](https://github.com/bp74/StageXL) 
As, StageXL imports `'dart:html'`, it can not be used in [console application](https://www.dartlang.org/tutorials/server/cmdline) or in [aqueduct back-end](https://aqueduct.io/).

## Usage

A simple usage example from `example\poly_example.dart`:

```dart
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
