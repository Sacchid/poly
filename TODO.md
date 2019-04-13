1. Add YX to XY
2. Fix Error - type `List<dynamic>` is not a subtype of type `List<num>` in type cast inside `csvToPoly` function
2. Add a check to see if it's `List<List<num>>` or just `List` if it's casted
3. `kml` support
4. Add `json` support ??
5. Polygon Name ?? - add optional name parameter in constructor 
6. Increase speed in most functions, by directly calling `contains` instead of `to_Point` which internally calls `contains`   
[poly.dart](lib/poly.dart)
(25, 3) //TODO - Add YX to XY
(26, 3) //TODO - kml support
(59, 3) //TODO - Add a check to see if it's List<List<num>> or just List if it's casted
(85, 4) // TODO: Add json support ??