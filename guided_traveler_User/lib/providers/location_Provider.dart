import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guided_traveler/controllers/tracking_Controller.dart';
import 'package:guided_traveler/models/user_model.dart';
import 'package:guided_traveler/providers/auth/user_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class LocationProvider extends ChangeNotifier {
  final TrackingController _trackingController = TrackingController();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Position? _position;

  Position? get position => _position;

  List<Placemark> _placemarks = [];

  // //--lorder
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  // void setLoader(bool val) {
  //   //_isLoading = val;
  //   //notifyListeners();
  // }

  // Future<double?> getCurrentPosition() async {
  //   try {
  //     //setLoader(true);
  //     //--get position details
  //     _position = await _determinePosition();
  //     notifyListeners();

  //     //---check if the position is null or not
  //     if (_position != null) {
  //       _placemarks = await placemarkFromCoordinates(
  //           _position!.latitude, _position!.longitude);
  //       return _position!;
  //       Logger().w(_placemarks.first);
  //     }
  //     return null;
  //     //setLoader(false);
  //   } catch (e) {
  //     Logger().e(e);
  //     //setLoader(false);
  //   }
  // }

  Future<String?> getCurrenlatitude() async {
    try {
      //setLoader(true);
      //--get position details
      _position = await _determinePosition();
      notifyListeners();

      if (_position != null) {
        _placemarks = await placemarkFromCoordinates(
            _position!.latitude, _position!.longitude);
        //var location = new LatLng(_position!.latitude, _position!.longitude);
        return _position!.latitude.toString();
        Logger().w(_placemarks.first);
      }
      return null;
      //setLoader(false);
    } catch (e) {
      Logger().e(e);
      //setLoader(false);
    }
  }

  Future<String?> getCurrenlongitude() async {
    try {
      //setLoader(true);
      //--get position details
      _position = await _determinePosition();
      notifyListeners();

      if (_position != null) {
        _placemarks = await placemarkFromCoordinates(
            _position!.latitude, _position!.longitude);
        // var location =
        // await new LatLng(_position!.latitude, _position!.longitude);

        return position!.longitude.toString();
        Logger().w(_placemarks.first);
      }
      return null;
      //setLoader(false);
    } catch (e) {
      Logger().e(e);
      //setLoader(false);
    }
  }

  // Future<void> trackingCustomer() async {
  //   try {
  //     // setLoader = true;
  //     await _trackingController.saveTrackingDetails(
  //       _position!,
  //     );

  //     //-stop the loader
  //     //setLoader = false;
  //   } catch (e) {
  //     //-stop the loader
  //     //setLoader = false;
  //     Logger().e(e);
  //   }
  // }.

  Future<void> trackingCustomer(
      String lat, String lon, BuildContext context) async {
    try {
      UserModel user =
          Provider.of<userProvider>(context, listen: false).userModel!;
      await _trackingController.saveTrackingDetails(user, lat, lon);
      // print("latitude is " + lat);
      // print("longitude is " + lat);
      //-stop the loader
    } catch (e) {
      //-stop the loader

      Logger().e(e);
    }
  }
}
