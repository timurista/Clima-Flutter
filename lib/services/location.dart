import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Location() {}
  double _latitude;
  double _longitude;

  double get longitude => _longitude;
  double get latitude => _latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
      );
      _latitude = position.latitude;
      _longitude = position.longitude;

      print(position);
    } catch (e) {
      print(e);
    }
  }
}
