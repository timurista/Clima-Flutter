import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool loading = true;
  Position position;
  WeatherModel weatherModel = WeatherModel();

  final loc = Location();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    setState(() {
      loading = true;
    });
    await loc.getCurrentLocation();

    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? SpinKitDoubleBounce(
                color: Colors.white,
                size: 100.0,
              )
            : Text("success"),
      ),
    );
  }
}
