# poly
[![Pub](https://img.shields.io/pub/v/poly.svg)](https://pub.dartlang.org/packages/poly)
[![build status](https://travis-ci.org/Sacchid/poly.svg)](https://travis-ci.org/Sacchid/poly#)
[![License](https://img.shields.io/badge/License-BSD%202--Clause-blue.svg)](https://opensource.org/licenses/BSD-2-Clause)

A library for checking if given point(s) is present inside Polygon or not.

### Contents
*   [Installation](#installation)
*   [Examples](#examples)
*   [Note: Instead of casting, use `toListNum()` & `toListListNum()`](#note-instead-of-casting-use-tolistnum--tolistlistnum)
*   [Function List](#function-list)
    - [Conversions ](#conversion-type)  
    - [is Point(s) inside](#is-points-inside)
        1. [Check if Single `Point` is inside](#check-if-single-point-is-inside)      
        2. [Check if Multiple Points are inside given Polygon](#check-if-multiple-points-are-inside-given-polygon)        
    - [Checks if 2 `Polygon` have same vertices i.e. `points`](#checks-if-2-polygon-have-same-vertices-ie-points)   
    - [CSV](#csv)   
* [Exceptions](#exceptions)
* [Detailed Index](#index)

# Installation

[To install poly for your Dart project, simply add poly to your
pub dependencies.](https://pub.dartlang.org/packages/poly#-installing-tab- "installing poly from pub.dartlang")

    dependencies:
        poly^ 1.0.5

## Examples
### [1. A  very simple usage example ](example/poly_example.dart "Basic example")
 1. Creates 2 Polygons from `List<Point>`
 2. Checks if 2 `Polygon` have same vertices i.e. `points` : using `hasSamePoint()`
 2. Prints if given Points are inside Polygon
 3. Prints if all points in list are inside Polygon or not 
 4. Prints list of result for List of points if they are inside Polygon or not
* Here `hasSamePoint()`, `isPointInside(Point( ))`, `contains(x,y)`, `areAllPointsInsidePolygon_ListPoint()` & `getList_IsListOfPointInside()` are used.

### [2. Example of Conversions `List <=> Point`, `List<Point> <=> List<List>` & other](example/conversion.dart) 
1. Example of `toPoint()` & `pointToList()`
   * `toPoint()` converts `List<num>` to `Point<num>`
    * `pointToList()` converts `Point<num>` to `List<num>`
2. Example of `toListOfPoint()` & `pointsToList()`
   * `toListOfPoint()` converts `List<List<num>>` to `List<Point<num>>`
   * `pointsToList()` converts `List<Point<num>>` to `List<List<num>>`
3. Example of `toPolyFromListOfList()` & `listOfList()`
   * `toPolyFromListOfList()` converts `List<List<num>>` to `Polygon`
   * `listOfList()` returns `Polygon.points` as `List<List<num>>`
   * `toPolyFromListOfList()` gives Polygon & `backToListC2()` gives back List<List<num>>
   * Print status of List of List if they are inside our Polygon using `getList_IsListOfListInside`
   * Print if All points in List of List inside Polygon using


### [3. Examples of `List<dynamic>` => `List<num>` and `List<List<dynamic>>` => `List<List<num>>`](example/using_to.dart)
* `toListNum()` returns `List<num>` from a `List<dynamic>`
*  `toListListNum()` returns `List<List<num>>` from a `List<List<dynamic>>`
1. Examples of `toListNum()` 
    - without any optional parameters
    - with `replaceWithZero: true` and `sizeTwo: false`
    - with `sizeTwo: false`
2. Examples of `toListListNum()` 
    - without any optional parameters
    - with `swapXAndY: true`
    - with `replaceWithZero: true`
    - with `replaceWithZero: true` and `swapXAndY: true`

### [4. Simple CSV example ](example/simple_csv.dart)
* It contains examples of following functions - 
1. Example of `IsInsideResultWithXY_ToCSVString` 
   * Saving `ArePointsInside Results` to "IsInside.csv"
     * Headers row will be added, as `includeHeader` isn`t passed as `false`
     * And as `diffNameThanIsInside:"Example String"` is passed,
     * Header row will be `latitude,longitude,Example String`

2. Example of `toCSVString`
   * Saving `Polygon.points` to "Polygon.csv"
     * Headers row will be added, as `includeHeader` isn`t passed as `false`
     * And as `useXY` is passed as `true`
     * Header row will be `x,y`

3. Example of `csvToResult`
    * Display 1st row : 2nd element & 3rd element of "IsInside.csv"
        * e.g. here "longitude" and "Example String"
        * As, previously `xY_IsInside_ToCSVString` returned String with header
        * because optional parameter `header` was not set to false
   
4. Example of `csvToPoly`
    * Check if Point(18.507305, 73.806131) is inside Polygon readPolygon (Polygon from Polygon.csv)


### [5. Exception Handling Example](example/exception_handling.dart)
* It contains examples of following exceptions & errors -
1. `NeedsAtLeastThreePoints` is thrown if `Polygon.points` contains less than 3 points
2. `WrongSizeForPoint` is thrown if `toPoint()` has more or less than 2 element. Point has only x and y.
3. **`TypeError` is thrown if `List<dynamic>` is passed instead of `List<num>`** 
    * Here, casting can be used to cast `List<dynamic>` to `List<num>`
    * e.g. ` print(toPoint([1,2]));` 
      * Here, [1,2] has a type `List<dynamic>`
      * So, use `[1,2].cast<num>()`
4. `CastError example` - wrongly casting `List<num>` to `List<List<num>`


### [6. Easy Casting Example](example/easy_casting.dart)
* Without casting `List<dynamic>` to `List<num>` `TypeError`is thrown
1. Correct casting
    * casting `List<dynamic>` to `List<num>`
    * casting `List<dynamic>` to `List<List<num>>`
 
2. Passing `List` instead of `List<List>`
* Passing `List` instead of `List<List>` & casting it : throws `CastError` as shown below :
    > type `int` is not a subtype of type `List<num>` in type cast
* Passing `List` instead of `List<List>` but, without casting it : throws `TypeError` as shown below :
    > type `List<dynamic>` is not a subtype of type `List<List<num>>`
* [****Note: currently casting `List<List<dynamic>>` to `List<List<num>>` gives following `CastError` exception:****](https://github.com/dart-lang/sdk/issues/36614 "Dart-lang List<List<dyanamic>> to List<List<num>> Casting Issue")
    * without `as List<List<num>>` - 
    > type `List<dynamic>` is not a subtype of type `List<num>` in type cast
    * with `as List<List<num>>` - 
    > type `List<List<dynamic>>` is not a subtype of type `List<List<num>>` in type cast


## Note: Instead of casting, use `toListNum()` & `toListListNum()`
* Use `toListNum()` for `List<dynamic>` => `List<num>`
* Use `toListListNum()` for`List<List<dynamic>>` => `List<List<num>>`
        

# Function List

### Conversion Type
##### `List<num>` to `Point(x,y)` : use `toPoint()`
* i.e. `[x,y]`  ->  `Point(x,y)`
* Point can be created passing `List<num>` `toPoint()`.
* List must have exact 2 elements, else will throw `WrongSizeForPoint` exception

##### `Point(x,y)` to `List<num>` : use `pointToList()`
* i.e.  `Point(x,y)` ->  `[x,y]`
* List can be created passing `Point(x,y)` `pointToList()`.

##### `List<List<num>>` to `List<Point<num>>` : use `toListOfPoint()`
* i.e. `[ [x1,y1],[x2,y2],... ]`  ->  `[ Point(x1,y1), Point(x2,y2),... ]`
* List of Points can be created from `List<List<num>>` by passing it to `toListOfPoint()`

##### `List<Point<num>>` to `List<List<num>>` : use `pointsToList()`
* i.e.  `[ Point(x1,y1), Point(x2,y2),... ]` ->  `[ [x1,y1],[x2,y2],... ]`
* List can be created passing `List<Point<num>>` `pointsToList()`.

##### `List<List<num>>` to `Polygon` : use `toPolyFromListOfList()`
* i.e. `[ [x1,y1],[x2,y2],... ]`  ->  `Polygon( Point(x1,y1), Point(x2,y2),... )`
* Polygon can be returned from `List<List<num>>` by passing it to `toPolyFromListOfList()`

##### `List<List<num>>` to `Polygon` : use `listOfList()`
* i.e. `[ [x1,y1],[x2,y2],... ]`  from  `Polygon( Point(x1,y1), Point(x2,y2),... )` 
* `List<List<num>>` can be returned from `Polygon` by passing it to `listOfList()`

 
##### `List<dynamic>` to `List<num>` : use `toListNum()`
 * Returns `List<num>` from a `List<dynamic>`
 * Can be used with [toPoly] as it accepts `List<num>`
 * Optional Parameters -
   * `sizeTwo`
     - Default value `true`
     - When set `false`, `Output List` can have more than 2 elements
   * `replaceWithZero`
     - Default value `false`
     - When set `true`, elements with type `String` or `bool` will be replaced with 0, rather than being removed
   * `reverseIt`
     - Default value `false`
     - When set `true`, `List` will be reversed
     
##### `List<List<dynamic>>` to `List<List<num>>` : use `toListListNum()`
 * Returns `List<List<num>>` from a `List<List<dynamic>>`
 * Can be used with functions like [areAllPointsInsidePolygon_List] , [getList_IsListOfListInside] , [toPolyFromListOfList] , [toListOfPoint]  which accepts `List<List<num>>`
 * Optional Parameters -
   * `replaceWithZero`
     - Default value `false`
     - When set `true`, elements with type `String` or `bool` will be replaced with 0, rather than being removed
   * `swapXAndY`
     - Default value `false`
     - When set `true`, `xi` will be swapped with `yi` 
       - i.e. `[ [x1,y1], [x2,y2], ...]` -> `[ [y1,x1], [y2,x2], ...]`

### is Point(s) inside
##### Check if Single `Point` is inside
  ###### Get Status by passing `x` and `y` to `contains`
  * returns `true` if `(x,y)` is present inside `Polygon`
  ###### Get Status by passing `Point(x,y)` to `isPointInside`
  * returns `true` if `Point` is present inside `Polygon`

##### Check if Single `Point` is inside Polygon with tolerance of T meter
  ###### Get Status by passing `Point(x,y)` and Tolerance `T` to `isPointInside`
  
##### Check if Multiple Points are inside given Polygon
 ###### Get Status of each Point
* `getList_IsListOfListInside(List<List<num>>)` returns `List<bool>` 
* `getList_IsListOfPointInside(List<Point<num>>)` returns `List<bool>` 
 ###### Check if all given Points are inside given Polygon
* `areAllPointsInsidePolygon_List((List<List<num>>)` returns `true` or `false`
* `areAllPointsInsidePolygon_ListPoint(List<Point<num>>)` returns `true` or `false`

### Checks if 2 `Polygon` have same vertices i.e. `points`
* use `hasSamePoints()`


### CSV
#### `Get result(s) along with lat, lang as a CSV String : IsInsideResultWithXY_ToCSVString()`
* Returns result of `ArePointsInside` as CSV String which can be later saved or displayed
* Output CSV String will by default contain a header row - `latitude,longitude,isInside`
* Optional parameter: `bool useXY` 
     * By passing, optional parameter: `useXY` as true, header will be `x,y` instead of `latitude,longitude`
     * Default value of `useXY` is `false`
* Optional parameter: `String includeHeader`
     * if optional parameter - `includeHeader` is passed as `false`, returning String will not contain header row
 * Optional Named parameter: `String diffNameThanIsInside`
     * Different name than Default name(`isInside`) will be used by passing optional parameter: `diffNameThanIsInside`
#### `Get `Polygon` as CSV String : toCSVString()`
 * Returns `Polygon` as CSV String which can be later saved or displayed
 * Output CSV String will by default contain a header row - `latitude,longitude`
 * Optional Named parameter: `bool useXY`
    * By passing, optional parameter: `useXY` as true, header will be `x,y` instead of `latitude,longitude`
    * Default value of `useXY` is `false`
 * Optional Named parameter: `String includeHeader`
    * if optional parameter - `includeHeader` is is passed as `false`, returning String will not contain header row
#### `Get `Future<Polygon>` based on `csvString` : csvToPoly()`
 * Returns `Future<Polygon>` based on `csvString`
 * `csvString` may or may not contain header row
 * This function checks if `latitude,longitude` or `x,y` are reversed
     * By checking Header row label
     * i.e. By checking 1st row 1st element is neither "longitude" or "y"
   * If they are reversed, Returned `Polygon` will be `Polygon(latitude,longitude)`, instead of `Polygon(longitude,latitude)`
   * This can be manually set by passing optional parameter: `isReversed` as `true`
 * Optional parameter: `isReversed`
   * `isReversed` has default value = `false`
#### `csvToListOfList()`
 * Returns `Future<List<List>>` based on `csvString`
    * which then can be used - convert that list into `Polygon`
 * Optional parameter: `bool noHeader`
     * By passing optional parameter: `noHeader` as `true`, Resulting List will not contain header row
     * Default value `false`


### Exceptions
1. `NeedsAtLeastThreePoints` is thrown if `Polygon.points` contains less than 3 points
2. `WrongSizeForPoint` is thrown if `toPoint()` has more or less than 2 element. Point has only x and y.
3. **`_TypeError` is thrown if `List<dynamic>` is passed instead of `List<num>`** 
    * Here, casting can be used to cast `List<dynamic>` to `List<num>`
    * e.g. ` print(toPoint([1,2]));` 
      * Here, [1,2] has a type `List<dynamic>`
      * So, use `[1,2].cast<num>()`
4. `_CastError example` - casting `List<num>` to `List<List<num>`

### Index
*   [Installation](#installation)
*   [Examples](#examples)
    - [1. A  very simple usage example ](#1-a--very-simple-usage-example-examplepoly_exampledart-basic-example)
    - [2. Example of Conversions : `List <=> Point`, `List<Point> <=> List<List>` & other](#2-example-of-conversions-list--point-listpoint--listlist--otherexampleconversiondart)
    - [3. Examples of `List<dynamic>` => `List<num>` and `List<List<dynamic>>` => `List<List<num>>`](#3-examples-of-listdynamic--listnum-and-listlistdynamic--listlistnumexampleusing_todart)
    - [4. Simple CSV example](#4-simple-csv-example-examplesimple_csvdart)
    - [5. Exception Handling Example](#5-exception-handling-exampleexampleexception_handlingdart)
    - [6. Easy Casting Example](#6-easy-casting-exampleexampleeasy_castingdart)
*   [Note: Instead of casting, use `toListNum()` & `toListListNum()`](#note-instead-of-casting-use-tolistnum--tolistlistnum)
*   [Function List](#function-list)
    - [Conversions ](#conversion-type)
        1. [`toPoint()`](#listnum-to-pointxy--use-topoint)
        2. [`toListOfPoint()`](#listlistnum-to-listpointnum--use-tolistofpoint)
        3. [`toPolyFromListOfList()`](#listlistnum-to-polygon--use-topolyfromlistoflist)
        4. [`toListNum()`](#listdynamic-to-listnum--use-tolistnum)
        5. [`toListListNum()`](#listlistdynamic-to-listlistnum--use-tolistlistnum)
    
    - [is Point(s) inside](#is-points-inside)
        1. [Check if Single `Point` is inside](#check-if-single-point-is-inside)
            * [Get Status by passing `x` and `y` to `contains`](#get-status-by-passing-x-and-y-to-contains)
            * [Get Status by passing `Point(x,y)` to `isPointInside`](#get-status-by-passing-pointxy-to-ispointinside)
        
        2. [Check if Multiple Points are inside given Polygon](#check-if-multiple-points-are-inside-given-polygon)
            * [Get Status of each Point](#get-status-of-each-point)
            * [Check if all given Points are inside given Polygon](#check-if-all-given-points-are-inside-given-polygon)
   
    - [Checks if 2 `Polygon` have same vertices i.e. `points`](#checks-if-2-polygon-have-same-vertices-ie-points)
    
    - [CSV](#csv)
        * [`Get result(s) along with lat, lang as a CSV String : IsInsideResultWithXY_ToCSVString()`](#get-results-along-with-lat-lang-as-a-csv-string--isinsideresultwithxy_tocsvstring)
        * [`Get `Polygon` as CSV String : toCSVString()`](#get-polygon-as-csv-string--tocsvstring)
        * [`Get `Future<Polygon>` based on `csvString` : csvToPoly()`](#get-futurepolygon-based-on-csvstring--csvtopoly)
        * [`csvToListOfList()`](#csvtolistoflist)

* [Exceptions](#exceptions)

* [Index](#index)

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/Sacchid/poly/issues

## Licence 
Implemented `contains` function logic from [StageXL - A fast and universal 2D rendering engine for HTML5 and Dart](https://github.com/bp74/StageXL) 

As, StageXL imports ``dart:html``, it can not be used in [console application](https://www.dartlang.org/tutorials/server/cmdline) or in [aqueduct back-end](https://aqueduct.io/).

Also, function `distanceInMeter` is implemented by using formulas for [Algorithm](https://edwilliams.org/avform.htm#Dist) & [it's NOAA online calculator](www.nhc.noaa.gov)

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).


