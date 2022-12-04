// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'dart:async';

import 'package:client/pages/autho/signup.dart';
import 'package:flutter/material.dart';
import 'package:client/constants.dart';
import 'package:client/service/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';


import '../service/auth_service.dart';

class MapScreen extends StatefulWidget {
  // const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LocationService locationService = LocationService();
  AuthService authService = AuthService();


  LatLng? currentLocation, cordinate;

  StreamSubscription<LocationData>? locationSubscription;
  Offset offset = Offset.zero;

  @override
  void initState() {
    locationService.getCurrentLoc().then((value) => setState(() {
          currentLocation = value;
          cordinate = value;
        }));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  PopupMenuItem createItemMenu(String title, IconData iconData, int valeur) {
    return PopupMenuItem(
      value: valeur,
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        leading: const Icon(Icons.account_circle_rounded),
        title: const Text('Main page'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              ifItemSelectedDo(value as int);
            },
            itemBuilder: (ctx) => [
              createItemMenu('Exit', Icons.exit_to_app, 0),
            ],
          )
        ],
        automaticallyImplyLeading: false, // simple as that!
        centerTitle: true, // like this!
      ),
      resizeToAvoidBottomInset: false,
      body: currentLocation == null||cordinate == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(2, 2),
                    zoom: 2,
                  ),
                  mapType: MapType.normal,
                  onMapCreated: (controller) async {
                    locationService.controller.complete(controller);
                    locationService.animateCameraPos(currentLocation!);
                  },
                  //onCameraMove: (e) => currentLocation = e.target,
                  markers: {
                    Marker(
                      markerId: MarkerId(cordinate.toString()),
                      icon: BitmapDescriptor.defaultMarker,
                      // icon: _locationIcon,
                      position: cordinate!,
                      infoWindow: InfoWindow(
                          title: "DESTINATION",
                          snippet:
                              "${cordinate?.latitude}, ${cordinate?.longitude}"),
                    ),
                  },
                  // polylines: polylineService.currentRoute,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,

                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  onTap: (value) {
                    locationService.animateCameraPos(value);
                    setState(() {
                      cordinate = value;
                    });
                  },
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                        margin: EdgeInsets.all(1),
                        color: Colors.white24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                onPressed: showSearchDialog,
                                icon: const Icon(Icons.search),
                                label: const Text("Search"),
                              ),
                            ),
                          ],
                        ))),
                Align(
                  alignment: Alignment.bottomLeft,
                  // add your floating action button
                  child: Card(
                    margin: EdgeInsets.all(1),
                    color: Colors.white24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            locationService.animateCameraPos(currentLocation!);

                          },
                          mini: false,
                          child: const Icon(Icons.gps_fixed),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.directions_car),
                            label: const Text("Ask For a Car"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }



  void ifItemSelectedDo(int value) {
    if (value == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => const SignUpPage()));
      dispose();
    }
  }


  Future<void> showSearchDialog() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: Constants.apiKey,
        mode: Mode.overlay,
        language: "fr",
        components: [Component(Component.country, "fr")]);
    locationService.getLocationFromPlaceId(p!.placeId!);
  }


}
