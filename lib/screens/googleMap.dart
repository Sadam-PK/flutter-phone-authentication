import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  // const MapScreen({ Key? key }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  Position currentPosition;
  var geoLocator = Geolocator();
  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latlagPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latlagPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(37.429613358, -122.085749655962), zoom: 14);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

              locatePosition();
            },
          )
        ],
      ),
    );
  }
}
