import 'package:flutter/material.dart';
// import 'package:flutter_mapbox_navigation/library.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

void main() {
  runApp(MyApp());
}

String accessToken =
    'pk.eyJ1IjoiZ2FkaXNoaW13ZSIsImEiOiJja2J0N2s2aG4wNzgyMnJxejVocnB6c3V6In0.RmmigUOoaxG_WIiMUqIm7w';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapboxMapController _mapController;
  // MapboxNavigation _directions;
  // bool _arrived = false;
  // double _distanceRemaining, _durationRemaining;

  // @override
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  void _onMapCreated(MapboxMapController controller) {
    _mapController = controller;
  }

  // Future<void> initPlatformState() async {
  //   if (!mounted) return;
  //   _directions = MapboxNavigation(onRouteProgress: (arrived) async {
  //     _distanceRemaining = await _directions.distanceRemaining;
  //     _durationRemaining = await _directions.durationRemaining;

  //     setState(() {
  //       _arrived = arrived;
  //     });
  //     if (arrived) {
  //       await Future.delayed(Duration(seconds: 3));
  //       await _directions.finishNavigation();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Stack(
        children: <Widget>[
          MapboxMap(
            accessToken: accessToken,
            initialCameraPosition:
                CameraPosition(target: LatLng(-1.9441, 30.0619), zoom: 16),
            myLocationEnabled: true,
            myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
            onMapCreated: _onMapCreated,
          ),
          // RaisedButton(
          //     child: Text('Navigate'),
          //     onPressed: () async {
          //       LatLng currentPosition =
          //           await _mapController.requestMyLocationLatLng();
          //       WayPoint _origin = WayPoint(
          //         name: 'Current location',
          //         latitude: currentPosition.latitude,
          //         longitude: currentPosition.longitude,
          //       );
          //       WayPoint _destination = WayPoint(
          //         name: 'Nyamirambo Stadium',
          //         latitude: -1.978918,
          //         longitude: 30.044339,
          //       );
          //       return await _directions.startNavigation(
          //         origin: _origin,
          //         destination: _destination,
          //         mode: MapBoxNavigationMode.drivingWithTraffic,
          //         simulateRoute: true,
          //         language: "English",
          //         units: VoiceUnits.metric,
          //       );
          //     })
        ],
      ),
    );
  }
}
