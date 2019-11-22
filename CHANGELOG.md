## 1.0.0
- Initial version, with `Polygon`, `contains()`
## 1.0.1 
As suggested by pub.dartlang.org analysis
- Ran dartfmt on poly.dart & 
- Added description in pubspec.yaml
## 1.0.2
As suggested by pub.dartlang.org analysis
- Removed some description from pubspec.yaml
## 1.0.3
Added following functions & examples for - 
* [Exception handling](example/exception_handling.dart)
* [Easy Casting](example/easy_casting.dart)
* [Simple CSV](example/simple_csv.dart)
* [Conversion](example/conversion.dart)

## 1.0.4
- Optimized imports
- Added `Polygon.hasSamePoint()`
- [Issue raised for `List<List<dyanamic>>` to `List<List<num>>` casting exception](https://github.com/dart-lang/sdk/issues/36614 "Dart-lang List<List<dyanamic>> to List<List<num>> Casting Issue")

### 1.0.5
- Added `toListNum()` along with [examples](example/using_to.dart)
- Added `toListListNum()` along with [examples](example/using_to.dart)

### 1.0.6
- Updated documentation to include Travis CI [![build status](https://travis-ci.org/Sacchid/poly.svg)](https://travis-ci.org/Sacchid/poly#)

### 1.0.7
* Added following functions - 
    - `listOfList()`
    - `pointToList()` : `Point` => `List<num>`
    - `pointsToList`  : `List<Point>` => `List<List (x,y)>`
    
### 1.0.7+1
* Added following functions - 
    - `distanceInMeter` which calculates distance between two points {lat1,lon1} and {lat2,lon2} in meter
    - `isPointInsideT`
### 1.0.7+2 
* Fix to `isPointInsideT`   