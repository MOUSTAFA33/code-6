import 'dart:async';

import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as locations ;

import '../constants.dart';

class LocationService {
  locations.Location location=locations.Location();
  Completer<GoogleMapController> controller = Completer();


  Future<LatLng> getCurrentLoc() async {
    bool serviceEnabled;
    locations.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception();
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == locations.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != locations.PermissionStatus.granted) {
        throw Exception();
      }
    }

    locations.LocationData myLocation1 = await location.getLocation();

    return LatLng(myLocation1.latitude!,myLocation1.longitude!);
  }

  Future<void> animateCameraPos(LatLng myLocation) async {
    final GoogleMapController futureController = await controller.future;
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(myLocation.latitude, myLocation.longitude),
       zoom: 15.00,
    );
    futureController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
  Future<void> getLocationFromPlaceId(String placeId) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: Constants.apiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(placeId);

    animateCameraPos(LatLng(detail.result.geometry!.location.lat,
        detail.result.geometry!.location.lng));
  }


}