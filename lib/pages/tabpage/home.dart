// import 'dart:async';
// import 'package:drive/service/auth_service.dart';
// import 'package:drive/splash/screen.dart';
import 'package:flutter/material.dart';

import '../map_screen.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// import '../widgets/used_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final Completer<GoogleMapController> controller = Completer();
  // AuthService authService = AuthService();
  // PopMenus PM=PopMenus();
  //
  // static LatLng sourceLocation = const LatLng(26.4983, 8.4776);
  // static LatLng destinationLocation = const LatLng(26.5060, 8.4857);
  //
  // List<LatLng> polylineCoordinates = [];
  //
  // //loc.Locations? currentLoc;
  // LocationData? currentLocation;
  // void getCurrentLocation() async {
  //   //currentLoc = loc.getGoogleOffices() as loc.Locations?;
  //
  //   Location location = Location();
  //
  //   location.getLocation().then((location) {
  //     currentLocation = location;
  //   });
  //   print(currentLocation);
  //   GoogleMapController googleMapController = await controller.future;
  //   // to move in map
  //   location.onLocationChanged.listen((newloc) {
  //     currentLocation = newloc;
  //     googleMapController.animateCamera(CameraUpdate.newCameraPosition(
  //         CameraPosition(target: LatLng(newloc.latitude!, newloc.longitude!),)));
  //     setState(() {});
  //   });
  // }
  //
  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       "AIzaSyA840nVnVVKHFsUeRhCu5Z7F-58NOAsrjw",
  //       PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
  //       PointLatLng(
  //           destinationLocation.latitude, destinationLocation.longitude));
  //   if (result.points.isNotEmpty) {
  //     for (var point in result.points) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     }
  //     setState(() {});
  //   }
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getCurrentLocation();
  //   getPolyPoints();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapScreen(),
    );
  }

  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         backgroundColor: Colors.green[700],
  //         leading: const Icon(Icons.account_circle_rounded),
  //         title: const Text('Work Page'),
  //         actions: [
  //           PopupMenuButton(
  //             onSelected: (value) {
  //               ifItemSelectedDo(value as int);
  //             },
  //             itemBuilder: (ctx) => [
  //               PM.createItemMenu('Exit', Icons.exit_to_app, 0),
  //             ],
  //           )
  //         ],
  //         automaticallyImplyLeading: false, // simple as that!
  //         centerTitle: true, // like this!
  //       ),
  //       body: currentLocation == null
  //           ? const Center(
  //               child: Text("loading"),
  //             )
  //           : GoogleMap(
  //               mapType: MapType.normal,
  //               onMapCreated: (mapController) {
  //                 controller.complete(mapController);
  //               },
  //               initialCameraPosition: CameraPosition(
  //                 target: LatLng(
  //                     currentLocation!.latitude!, currentLocation!.longitude!),
  //                 //zoom: 14,
  //               ),
  //               polylines: {
  //                 Polyline(
  //                   polylineId: const PolylineId("route"),
  //                   points: polylineCoordinates,
  //                   color: Colors.blue,
  //                   width: 6,
  //                 )
  //               },
  //               markers: {
  //                 Marker(
  //                   markerId: const MarkerId("currentloc"),
  //                   position: LatLng(currentLocation!.latitude!,
  //                       currentLocation!.longitude!),
  //
  //                 ),
  //                 Marker(
  //                   markerId: const MarkerId("source"),
  //                   position: sourceLocation,
  //                 ),
  //                 Marker(
  //                   markerId: const MarkerId("destination"),
  //                   position: destinationLocation,
  //                 ),
  //               },
  //             ),
  //     ),
  //   );
  // }
  //
  //
  // void ifItemSelectedDo(int value) {
  //   if (value == 0) {
  //     authService.signOut();
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (c) => const ScreenA()));
  //   }
  // }

}
