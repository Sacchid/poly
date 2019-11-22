import 'package:poly/poly.dart';
import 'dart:io';

main() async {
  int countCSV = 0;
  Polygon location_eleven = Polygon([
    Point(18.507305, 73.806131),
    Point(18.508689, 73.806131),
    Point(18.509299, 73.805916),
    Point(18.509848, 73.805981),
    Point(18.512941, 73.806024),
    Point(18.512941, 73.803492),
    Point(18.512453, 73.802032),
    Point(18.512283, 73.800424),
    Point(18.511964, 73.798943),
    Point(18.511822, 73.798749),
    Point(18.513429, 73.79817),
    Point(18.514813, 73.797483),
    Point(18.514854, 73.796818),
    Point(18.515342, 73.796067),
    Point(18.515688, 73.795896),
    Point(18.516115, 73.795788),
    Point(18.517377, 73.79581),
    Point(18.518394, 73.794222),
    Point(18.519696, 73.795595),
    Point(18.520551, 73.796153),
    Point(18.523155, 73.799028),
    Point(18.523643, 73.800831),
    Point(18.523888, 73.802118),
    Point(18.524172, 73.80259),
    Point(18.524091, 73.80362),
    Point(18.524539, 73.804607),
    Point(18.524591, 73.808944),
    Point(18.524783, 73.809571),
    Point(18.524094, 73.811088),
    Point(18.524295, 73.81259),
    Point(18.525454, 73.814199),
    Point(18.526166, 73.814886),
    Point(18.524172, 73.817761),
    Point(18.523237, 73.818169),
    Point(18.5211, 73.822246),
    Point(18.520388, 73.823254),
    Point(18.520063, 73.824456),
    Point(18.519208, 73.827052),
    Point(18.517133, 73.826108),
    Point(18.516278, 73.824906),
    Point(18.514894, 73.824649),
    Point(18.514813, 73.824306),
    Point(18.513674, 73.824263),
    Point(18.513429, 73.824048),
    Point(18.511964, 73.824048),
    Point(18.511151, 73.824391),
    Point(18.51054, 73.824563),
    Point(18.509706, 73.825486),
    Point(18.507627, 73.826341),
    Point(18.507684, 73.827277),
    Point(18.506822, 73.827609),
    Point(18.506329, 73.826702),
    Point(18.505942, 73.825421),
    Point(18.506104, 73.82467),
    Point(18.507395, 73.823462),
    Point(18.508282, 73.822739),
    Point(18.509584, 73.821495),
    Point(18.510377, 73.820529),
    Point(18.510479, 73.820035),
    Point(18.510479, 73.819048),
    Point(18.510418, 73.818233),
    Point(18.50995, 73.815637),
    Point(18.509665, 73.814692),
    Point(18.509563, 73.813834),
    Point(18.50934, 73.811817),
    Point(18.508404, 73.810508),
    Point(18.508119, 73.809135),
    Point(18.507346, 73.807611),
    Point(18.507305, 73.806131),
  ]);
  List<Point<num>> checkPoints = [
    Point(18.5124785, 73.8206602),
    Point(18.5112654, 73.8172661),
    Point(18.5016256, 73.8094801),
    Point(18.5115046, 73.8171069),
    Point(18.5109839, 73.8154427),
    Point(18.5112721, 73.8162126),
    Point(18.5163667, 73.8075354),
    Point(18.5124489, 73.8207613),
    Point(18.5127482, 73.8189808),
    Point(18.5060939, 73.8259163),
    Point(18.5114909, 73.8164503),
    Point(18.508175, 73.822866),
    Point(18.5128381, 73.8112762),
    Point(18.5017223, 73.8094366),
    Point(18.5150109, 73.8159275),
    Point(18.5163667, 73.8075354),
    Point(18.5014018, 73.80952),
    Point(18.5112285, 73.8171876),
    Point(18.5078999, 73.8229854),
    Point(18.5135063, 73.8159908),
    Point(18.5110897, 73.8176941),
    Point(18.5107774, 73.8157407),
    Point(18.5011049, 73.8096167),
    Point(18.5128833, 73.8181274),
    Point(18.514984, 73.8159425),
    Point(18.5082853, 73.8229171),
    Point(18.5109213, 73.8172806),
    Point(18.5019752, 73.8094272),
    Point(18.5036271, 73.8557149),
    Point(18.5112384, 73.8171174),
    Point(18.5112384, 73.8171174),
    Point(18.5112384, 73.8171174),
    Point(18.5114182, 73.8170969),
    Point(18.5019349, 73.8096291),
    Point(18.5149707, 73.8154424),
    Point(18.5111738, 73.8171607),
    Point(18.5111634, 73.8171551),
    Point(18.5120293, 73.8113572),
    Point(18.5012618, 73.8095137),
    Point(18.5124395, 73.8207164),
    Point(18.503084, 73.8088517),
    Point(18.5124448, 73.8207177),
    Point(18.5112947, 73.8198235),
    Point(18.5117293, 73.8167963),
    Point(18.5142932, 73.8169554),
    Point(18.5123237, 73.8170578),
    Point(18.515029, 73.8159474),
    Point(18.5125214, 73.8086799),
    Point(18.5112435, 73.817181),
    Point(18.5124343, 73.8206081),
    Point(18.5079338, 73.8228738),
    Point(18.5117969, 73.8117694),
    Point(18.5112558, 73.817308),
    Point(18.5115868, 73.8169698),
    Point(18.5115922, 73.8169871),
    Point(18.5615843, 73.8141527),
    Point(18.5035994, 73.8557277),
    Point(18.56675, 73.8075583),
    Point(18.5542636, 73.8051996),
    Point(18.5024549, 73.8781556),
    Point(18.5541433, 73.805365),
    Point(18.5542963, 73.8053572),
    Point(18.5072059, 73.8262839),
    Point(18.5746887, 73.76487),
    Point(18.5543487, 73.8055963),
    Point(18.5542637, 73.8053565),
    Point(18.5542578, 73.8054209),
    Point(18.5611495, 73.8149408),
    Point(18.5555028, 73.8057247),
    Point(18.554192, 73.8054267),
    Point(18.507693, 73.796015),
    Point(18.5612433, 73.8145167),
    Point(18.5542637, 73.8053565),
    Point(18.5542637, 73.8053565),
    Point(18.5542637, 73.8053565),
    Point(18.5542637, 73.8053565),
    Point(18.5619854, 73.7928126),
    Point(18.5280783, 73.8303274),
    Point(18.5035991, 73.8557274),
    Point(18.5542247, 73.8053859),
    Point(18.5542579, 73.8052151),
    Point(18.5036077, 73.8557219),
    Point(18.5542637, 73.8053565),
    Point(18.5542735, 73.805281),
    Point(18.5552057, 73.8160962),
    Point(18.5036221, 73.8557353),
    Point(18.5542557, 73.8051856),
    Point(18.5036307, 73.8557221),
    Point(18.5606828, 73.8148879),
    Point(18.5542889, 73.8054483),
    Point(18.5542979, 73.8055085),
    Point(18.5542557, 73.8051856),
    Point(18.5035764, 73.8557534),
    Point(18.5542557, 73.8051856),
  ];

  String nameOfIsInsideResult = "IsInside.csv";
  String nameOfPolygon = "Polygon.csv";

  // Example of `IsInsideResultWithXY_ToCSVString`
  //* Saving `ArePointsInside Results` to "IsInside.csv"
  //  * Headers row will be added, as `includeHeader` isn't passed as `false`
  //  * And as `diffNameThanIsInside:"Example String"` is passed,
  //  * Header row will be `latitude,longitude,Example String`
  // Get `ArePointsInside` as CSV String - `csvOfIsInsideResult`
  String csvOfIsInsideResult = location_eleven.IsInsideResultWithXY_ToCSVString(
      checkPoints,
      diffNameThanIsInside: "Example String");
  // Write `String csvOfIsInsideResult` to "IsInside.csv"
  File(nameOfIsInsideResult).writeAsStringSync(csvOfIsInsideResult);
  print('${++countCSV}. ArePointsInside Results saved to IsInside.csv ');

  // Example of `toCSVString`
  //* Saving `Polygon.points` to "Polygon.csv"
  //  * Headers row will be added, as `includeHeader` isn't passed as `false`
  //  * And as `useXY` is passed as `true`
  //  * Header row will be `x,y`
  String csvOfPolygon = location_eleven.toCSVString(useXY: true);
  // Write `String csvOfIsInsideResult` to "Polygon.csv"
  File(nameOfPolygon).writeAsStringSync(csvOfPolygon);
  print('${++countCSV}. `Polygon.points` saved to Polygon.csv ');

  // Example of `csvToResult`
  //* Display 1st row : 2nd element & 3rd element of "IsInside.csv"
  //* e.g. here "longitude" and "Example String"
  //* As, previously `xY_IsInside_ToCSVString` returned String with header
  //* because optional parameter `header` was not set to false
  final IsInsideList = File(nameOfIsInsideResult).openRead();
  final l = await csvToListOfList(IsInsideList);
  print("${++countCSV}. e.g. here ${l[0][1]} and ${l[0][2]}");

  // Example of `csvToPoly`
  //* Check if Point(18.507305, 73.806131) is inside Polygon readPolygon (Polygon from Polygon.csv)
  final readPolygon = File(nameOfPolygon).openRead();
  Polygon newPolygon = await csvToPoly(readPolygon);
  print(
      "${++countCSV}. Is Point(18.507305, 73.806131) inside Polygon (saved in Polygon.csv) : ${newPolygon.contains(18.507305, 73.806131)}");
}
