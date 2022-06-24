import 'dart:async';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage> createState() => TrackingPageState();
}

class TrackingPageState extends State<TrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(6.8018, 79.9227);
  static const LatLng destinationLocation = LatLng(6.7951276, 79.900867);

  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ))));
      setState(() {});
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tracking",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: currentLocation == null
            ? const Center(child: Text("Loading"))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: sourceLocation,
                    // LatLng(currentLocation!.latitude!,
                    //     currentLocation!.longitude!),
                    zoom: 13.5),
                markers: {
                  Marker(
                      markerId: const MarkerId("currentLocation"),
                      position: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!)),
                  const Marker(
                    markerId: MarkerId("destination"),
                    position: destinationLocation,
                  ),
                  const Marker(
                    markerId: MarkerId("source"),
                    position: sourceLocation,
                  )
                },
                onMapCreated: (mapController) {
                  _controller.complete(mapController);
                },
              ),
        bottomNavigationBar: MyBottomNavBar());
  }
}
