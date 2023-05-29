import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guided_traveler/controllers/tracking_Controller.dart';

import 'package:logger/logger.dart';

class TrackingProvider with ChangeNotifier {
  final TrackingController _trackingController = TrackingController();

  // //---latitude controler
  // final _latitude = TextEditingController();

  // //--- get latitude controller
  // TextEditingController get latitudeController => _latitude;

  // //---longitude controler
  // final _longitude = TextEditingController();

  // //--- get longitude controller
  // TextEditingController get longitudeController => _longitude;

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // Future<void> trackingCustomer(var lat, var lon) async {
  //   try {
  //     setLoader = true;
  //     await _trackingController.saveTrackingDetails(lat, lon);
  //     //-stop the loader
  //     setLoader = false;
  //   } catch (e) {
  //     //-stop the loader
  //     setLoader = false;
  //     Logger().e(e);
  //   }
  // }
}
