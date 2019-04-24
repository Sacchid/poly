////import 'package:poly/poly.dart';
//import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
//
//import 'dart:io';
//
////FileSystemException: Cannot create file, path = 'test/files/test.xlsx' (OS Error: Access is denied.
////, errno = 5)
////void createFileRecursively(String filename) {
////  if(!(Directory(filename).existsSync()))
////  // Create a new directory, recursively creating non-existent directories.
////  {
////    Directory(filename).createSync(recursive: true);
////    File(filename).createSync();
////  }
////}
//int rowLength(var decoder,{int worksheet=0,int row =0}){
//  var table = decoder.tables[getNameOfWorksheet(decoder, worksheet : worksheet)];
//  return table.rows[row].length;
//}
//// Getting `RangeError` when input `rowValue.length` - 1 > `maxCols`
//// And it doesn't change
//void updateRow(var decoder,List rowValue,{int worksheet = 0,int rowNumber=0}){
//  String workSheet = getNameOfWorksheet(decoder,worksheet: worksheet);
//  int newRowL = rowValue.length - 1;
//  int oldRowL = decoder.tables[workSheet].maxCols;
//  for(int i = newRowL - oldRowL; i > 0 ;i--){
//    decoder..insertColumn(workSheet,oldRowL + i);
//  }
//  print("name: ${workSheet}");
//  for(int i = 0; i< newRowL; i++){
//    decoder.updateCell(workSheet, i, rowNumber, rowValue[i]);
//  }
// // return decoder;
//}
//String getNameOfWorksheet(var decoder,{int worksheet = 0}){
//  List names = getNamesOfWorksheet(decoder);
//  return names[worksheet];
//}
//int numberOfWorksheet(var decoder){
//  return decoder.tables.length;
//}
//List getNamesOfWorksheet(var decoder){
//  List names = [];
//  var table = decoder.tables;
//  table.forEach((key, value) => names.add(key) );
////  table.forEach((key, value) => print(key.runtimeType) );
//  return names;
//}
////void updatecell(){
////  var file = "poly1.xlsx";
////  //createFileRecursively(file);
////  var bytes = new File(file).readAsBytesSync();
////  var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);
////  var table = decoder.tables['Sheet1'];
////  var values = table.rows[0];
////  print(values);
////  decoder.updateCell('Sheet1', 0, 0, "Lat");
//////  decoder.tables['Sheet1'].rows[0] = ["Lat","Lang"];
////  values = table.rows[0];
////  print(values);
////  File(file).writeAsBytesSync(decoder.encode());
////}
//main(){
//  // unexpected behaviour - add new column with value c instated of adding/updating cell - A3 with value c
//  var file = "poly1.xlsx";
//  String workSheet = 'Sheet1';
//  var bytes = new File(file).readAsBytesSync();
//  var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);
//  //1
//  //  print(numberOfWorksheet(decoder));
//  //[Sheet1]
//  print("In sheet=${getNamesOfWorksheet(decoder)}, there are ${decoder.tables['Sheet1'].maxCols} columns");
//  //2
//  //  print(rowLength(decoder));
//
//  //List n = ["a","b","e"];
//  //updateRow(decoder, n);
////  File(file).writeAsBytesSync(decoder.encode());
//  print("Before: ${decoder.tables['Sheet1'].rows[0]} with ${rowLength(decoder)} columns");
//  decoder..insertColumn(workSheet, 2);
//  decoder..updateCell(workSheet, 2, 0, "c");
//  File(file).writeAsBytesSync(decoder.encode());
//  print("After:${decoder.tables['Sheet1'].rows[0]} with ${rowLength(decoder)} columns");
//}