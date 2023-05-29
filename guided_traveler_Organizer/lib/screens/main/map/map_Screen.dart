import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/utils/app_Colors.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController mapController;

  LatLng? _currentPosition;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  //get current location
  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const CustomText(
          'Map',
          fontSize: 24,
          color: AppColors.white,
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 15.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("marker"),
                  position: _currentPosition!,
                  draggable: true,
                  onDragEnd: (value) {
                    // value is the new position
                  },
                  // To do: custom marker icon
                ),
              },
            ),
    );
  }
}
