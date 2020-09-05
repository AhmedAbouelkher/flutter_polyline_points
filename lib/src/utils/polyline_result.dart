import '../../flutter_polyline_points.dart';
import 'dart:convert';

/// description:
/// project: flutter_polyline_points
/// @package:
/// @author: dammyololade
/// created on: 13/05/2020
class PolylineResult {
  /// the api status retuned from google api
  ///
  /// returns OK if the api call is successful
  String status;

  /// list of decoded points
  List<PointLatLng> points;

  /// the error message returned from google, if none, the result will be empty
  String errorMessage;

  //`PolylineResult` but has all the response data
  PolylineResultExtended polylineResultExtended;

  PolylineResult({this.status, this.points = const [], this.errorMessage = "", this.polylineResultExtended});
}

//* __________________-----------------------__________________-----------------________________----------------------________*//

PolylineResultExtended polylineResultExtendedFromJson(String str) => PolylineResultExtended.fromJson(json.decode(str));

String polylineResultExtendedToJson(PolylineResultExtended data) => json.encode(data.toJson());

class PolylineResultExtended {
  PolylineResultExtended({
    this.geocodedWaypoints,
    this.routes,
    this.status,
  });

  final List<GeocodedWaypoint> geocodedWaypoints;
  final List<Route> routes;
  final String status;

  PolylineResultExtended copyWith({
    List<GeocodedWaypoint> geocodedWaypoints,
    List<Route> routes,
    String status,
  }) =>
      PolylineResultExtended(
        geocodedWaypoints: geocodedWaypoints ?? this.geocodedWaypoints,
        routes: routes ?? this.routes,
        status: status ?? this.status,
      );

  factory PolylineResultExtended.fromJson(Map<String, dynamic> json) => PolylineResultExtended(
        geocodedWaypoints: json["geocoded_waypoints"] == null
            ? null
            : List<GeocodedWaypoint>.from(json["geocoded_waypoints"].map((x) => GeocodedWaypoint.fromJson(x))),
        routes: json["routes"] == null ? null : List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "geocoded_waypoints": geocodedWaypoints == null ? null : List<dynamic>.from(geocodedWaypoints.map((x) => x.toJson())),
        "routes": routes == null ? null : List<dynamic>.from(routes.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class GeocodedWaypoint {
  GeocodedWaypoint({
    this.geocoderStatus,
    this.placeId,
    this.types,
  });

  final String geocoderStatus;
  final String placeId;
  final List<String> types;

  GeocodedWaypoint copyWith({
    String geocoderStatus,
    String placeId,
    List<String> types,
  }) =>
      GeocodedWaypoint(
        geocoderStatus: geocoderStatus ?? this.geocoderStatus,
        placeId: placeId ?? this.placeId,
        types: types ?? this.types,
      );

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) => GeocodedWaypoint(
        geocoderStatus: json["geocoder_status"] == null ? null : json["geocoder_status"],
        placeId: json["place_id"] == null ? null : json["place_id"],
        types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "geocoder_status": geocoderStatus == null ? null : geocoderStatus,
        "place_id": placeId == null ? null : placeId,
        "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
      };
}

class Route {
  Route({
    this.bounds,
    this.copyrights,
    this.legs,
    this.overviewPolyline,
    this.summary,
    this.warnings,
    this.waypointOrder,
  });

  final Bounds bounds;
  final String copyrights;
  final List<Leg> legs;
  final PolylineExtended overviewPolyline;
  final String summary;
  final List<String> warnings;
  final List<dynamic> waypointOrder;

  Route copyWith({
    Bounds bounds,
    String copyrights,
    List<Leg> legs,
    PolylineExtended overviewPolyline,
    String summary,
    List<String> warnings,
    List<dynamic> waypointOrder,
  }) =>
      Route(
        bounds: bounds ?? this.bounds,
        copyrights: copyrights ?? this.copyrights,
        legs: legs ?? this.legs,
        overviewPolyline: overviewPolyline ?? this.overviewPolyline,
        summary: summary ?? this.summary,
        warnings: warnings ?? this.warnings,
        waypointOrder: waypointOrder ?? this.waypointOrder,
      );

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        bounds: json["bounds"] == null ? null : Bounds.fromJson(json["bounds"]),
        copyrights: json["copyrights"] == null ? null : json["copyrights"],
        legs: json["legs"] == null ? null : List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        overviewPolyline: json["overview_polyline"] == null ? null : PolylineExtended.fromJson(json["overview_polyline"]),
        summary: json["summary"] == null ? null : json["summary"],
        warnings: json["warnings"] == null ? null : List<String>.from(json["warnings"].map((x) => x)),
        waypointOrder: json["waypoint_order"] == null ? null : List<dynamic>.from(json["waypoint_order"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "bounds": bounds == null ? null : bounds.toJson(),
        "copyrights": copyrights == null ? null : copyrights,
        "legs": legs == null ? null : List<dynamic>.from(legs.map((x) => x.toJson())),
        "overview_polyline": overviewPolyline == null ? null : overviewPolyline.toJson(),
        "summary": summary == null ? null : summary,
        "warnings": warnings == null ? null : List<dynamic>.from(warnings.map((x) => x)),
        "waypoint_order": waypointOrder == null ? null : List<dynamic>.from(waypointOrder.map((x) => x)),
      };
}

class Bounds {
  Bounds({
    this.northeast,
    this.southwest,
  });

  final Northeast northeast;
  final Northeast southwest;

  Bounds copyWith({
    Northeast northeast,
    Northeast southwest,
  }) =>
      Bounds(
        northeast: northeast ?? this.northeast,
        southwest: southwest ?? this.southwest,
      );

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        northeast: json["northeast"] == null ? null : Northeast.fromJson(json["northeast"]),
        southwest: json["southwest"] == null ? null : Northeast.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast == null ? null : northeast.toJson(),
        "southwest": southwest == null ? null : southwest.toJson(),
      };
}

class Northeast {
  Northeast({
    this.lat,
    this.lng,
  });

  final double lat;
  final double lng;

  Northeast copyWith({
    double lat,
    double lng,
  }) =>
      Northeast(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory Northeast.fromJson(Map<String, dynamic> json) => Northeast(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class Leg {
  Leg({
    this.distance,
    this.duration,
    this.endAddress,
    this.endLocation,
    this.startAddress,
    this.startLocation,
    this.steps,
    this.trafficSpeedEntry,
    this.viaWaypoint,
  });

  final Distance distance;
  final Distance duration;
  final String endAddress;
  final Northeast endLocation;
  final String startAddress;
  final Northeast startLocation;
  final List<Step> steps;
  final List<dynamic> trafficSpeedEntry;
  final List<dynamic> viaWaypoint;

  Leg copyWith({
    Distance distance,
    Distance duration,
    String endAddress,
    Northeast endLocation,
    String startAddress,
    Northeast startLocation,
    List<Step> steps,
    List<dynamic> trafficSpeedEntry,
    List<dynamic> viaWaypoint,
  }) =>
      Leg(
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
        endAddress: endAddress ?? this.endAddress,
        endLocation: endLocation ?? this.endLocation,
        startAddress: startAddress ?? this.startAddress,
        startLocation: startLocation ?? this.startLocation,
        steps: steps ?? this.steps,
        trafficSpeedEntry: trafficSpeedEntry ?? this.trafficSpeedEntry,
        viaWaypoint: viaWaypoint ?? this.viaWaypoint,
      );

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        distance: json["distance"] == null ? null : Distance.fromJson(json["distance"]),
        duration: json["duration"] == null ? null : Distance.fromJson(json["duration"]),
        endAddress: json["end_address"] == null ? null : json["end_address"],
        endLocation: json["end_location"] == null ? null : Northeast.fromJson(json["end_location"]),
        startAddress: json["start_address"] == null ? null : json["start_address"],
        startLocation: json["start_location"] == null ? null : Northeast.fromJson(json["start_location"]),
        steps: json["steps"] == null ? null : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        trafficSpeedEntry:
            json["traffic_speed_entry"] == null ? null : List<dynamic>.from(json["traffic_speed_entry"].map((x) => x)),
        viaWaypoint: json["via_waypoint"] == null ? null : List<dynamic>.from(json["via_waypoint"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance == null ? null : distance.toJson(),
        "duration": duration == null ? null : duration.toJson(),
        "end_address": endAddress == null ? null : endAddress,
        "end_location": endLocation == null ? null : endLocation.toJson(),
        "start_address": startAddress == null ? null : startAddress,
        "start_location": startLocation == null ? null : startLocation.toJson(),
        "steps": steps == null ? null : List<dynamic>.from(steps.map((x) => x.toJson())),
        "traffic_speed_entry": trafficSpeedEntry == null ? null : List<dynamic>.from(trafficSpeedEntry.map((x) => x)),
        "via_waypoint": viaWaypoint == null ? null : List<dynamic>.from(viaWaypoint.map((x) => x)),
      };
}

class Distance {
  Distance({
    this.text,
    this.value,
  });

  final String text;
  final int value;

  Distance copyWith({
    String text,
    int value,
  }) =>
      Distance(
        text: text ?? this.text,
        value: value ?? this.value,
      );

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        text: json["text"] == null ? null : json["text"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "value": value == null ? null : value,
      };
}

class Step {
  Step({
    this.distance,
    this.duration,
    this.endLocation,
    this.htmlInstructions,
    this.polyline,
    this.startLocation,
    this.steps,
    this.travelMode,
    this.maneuver,
  });

  final Distance distance;
  final Distance duration;
  final Northeast endLocation;
  final String htmlInstructions;
  final PolylineExtended polyline;
  final Northeast startLocation;
  final List<Step> steps;
  final TravelModeExtended travelMode;
  final String maneuver;

  Step copyWith({
    Distance distance,
    Distance duration,
    Northeast endLocation,
    String htmlInstructions,
    PolylineExtended polyline,
    Northeast startLocation,
    List<Step> steps,
    TravelModeExtended travelMode,
    String maneuver,
  }) =>
      Step(
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
        endLocation: endLocation ?? this.endLocation,
        htmlInstructions: htmlInstructions ?? this.htmlInstructions,
        polyline: polyline ?? this.polyline,
        startLocation: startLocation ?? this.startLocation,
        steps: steps ?? this.steps,
        travelMode: travelMode ?? this.travelMode,
        maneuver: maneuver ?? this.maneuver,
      );

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        distance: json["distance"] == null ? null : Distance.fromJson(json["distance"]),
        duration: json["duration"] == null ? null : Distance.fromJson(json["duration"]),
        endLocation: json["end_location"] == null ? null : Northeast.fromJson(json["end_location"]),
        htmlInstructions: json["html_instructions"] == null ? null : json["html_instructions"],
        polyline: json["polyline"] == null ? null : PolylineExtended.fromJson(json["polyline"]),
        startLocation: json["start_location"] == null ? null : Northeast.fromJson(json["start_location"]),
        steps: json["steps"] == null ? null : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        travelMode: json["travel_mode"] == null ? null : travelModeValues.map[json["travel_mode"]],
        maneuver: json["maneuver"] == null ? null : json["maneuver"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance == null ? null : distance.toJson(),
        "duration": duration == null ? null : duration.toJson(),
        "end_location": endLocation == null ? null : endLocation.toJson(),
        "html_instructions": htmlInstructions == null ? null : htmlInstructions,
        "polyline": polyline == null ? null : polyline.toJson(),
        "start_location": startLocation == null ? null : startLocation.toJson(),
        "steps": steps == null ? null : List<dynamic>.from(steps.map((x) => x.toJson())),
        "travel_mode": travelMode == null ? null : travelModeValues.reverse[travelMode],
        "maneuver": maneuver == null ? null : maneuver,
      };
}

class PolylineExtended {
  PolylineExtended({
    this.points,
  });

  final String points;

  PolylineExtended copyWith({
    String points,
  }) =>
      PolylineExtended(
        points: points ?? this.points,
      );

  factory PolylineExtended.fromJson(Map<String, dynamic> json) => PolylineExtended(
        points: json["points"] == null ? null : json["points"],
      );

  Map<String, dynamic> toJson() => {
        "points": points == null ? null : points,
      };
}

enum TravelModeExtended { WALKING }

final travelModeValues = EnumValues({"WALKING": TravelModeExtended.WALKING});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
