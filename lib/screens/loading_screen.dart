import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool loading = true;
  Position position;
  final loc = Location();

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    setState(() {
      loading = true;
    });
    await loc.getCurrentLocation();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            loading ? Text('loading') : Text(loc.latitude.toStringAsFixed(1)),
      ),
    );
  }
}
