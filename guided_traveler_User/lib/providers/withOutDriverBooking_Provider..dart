import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/withDriverBooking_Controller.dart';
import 'package:guided_traveler/controllers/withOutDriverBooking_Controller.dart';
import 'package:guided_traveler/utils/alert_helper.dart';
import 'package:logger/logger.dart';

class WithOutDriverBookingProvider extends ChangeNotifier {
  final WithOutDriverBookingContoller _withOutDriverBookingContoller =
      WithOutDriverBookingContoller();

  //---vehicle customer phone no controler
  final _withOutDriverCustomerPickUpLocation = TextEditingController();

  //--- get vehicle customer phone no controller
  TextEditingController get withOutDriverCustomerPickUpLocationController =>
      _withOutDriverCustomerPickUpLocation;

  //---vehicle customer phone no controler
  final _withOutDriverCustomerWhatsappNo = TextEditingController();

  //--- get vehicle customer phone no controller
  TextEditingController get withOutDriverCustomerPhoneNoController =>
      _withOutDriverCustomerWhatsappNo;

  //---vehicle customer check in controler
  TextEditingController withOutDriverCustomerPickUp = TextEditingController();

  //--- get vehicle customer phone no controller
  TextEditingController get withOutDriverCustomerPickUpController =>
      withOutDriverCustomerPickUp;

  //---vehicle customer check out controler
  TextEditingController withOutDriverCustomerPickOut = TextEditingController();

  //--- get vehicle customer phone no controller
  TextEditingController get withOutDriverCustomerPickOutController =>
      withOutDriverCustomerPickOut;

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //---start saving vehicle data
  Future<void> stratSavewithOutDriverVehicleBooking(
      String uid,
      String name,
      String email,
      String vehicleName,
      String vehicleEmail,
      String vehicleNo,
      BuildContext context) async {
    try {
      if (_withOutDriverCustomerPickUpLocation.text.isNotEmpty &&
          _withOutDriverCustomerWhatsappNo.text.isNotEmpty &&
          withOutDriverCustomerPickUp.text.isNotEmpty &&
          withOutDriverCustomerPickOut.text.isNotEmpty) {
        //---start the loader
        setLoader = true;
        await _withOutDriverBookingContoller
            .saveWithOutDriverBooking(
          _withOutDriverCustomerPickUpLocation.text,
          _withOutDriverCustomerWhatsappNo.text,
          withOutDriverCustomerPickUp.text,
          withOutDriverCustomerPickOut.text,
          uid,
          name,
          email,
          vehicleName,
          vehicleEmail,
          vehicleNo,
        )
            .then(
          (value) {
            _withOutDriverCustomerPickUpLocation.clear();
            _withOutDriverCustomerWhatsappNo.clear();
            withOutDriverCustomerPickUp.clear();
            withOutDriverCustomerPickOut.clear();
            AlertHelper.showAlert(
                context, "Booking successfully", "", DialogType.success);

            notifyListeners();
          },
        );

        //---stop the loader
        setLoader = false;
      } else {
        AlertHelper.showAlert(
            context, "Booking error", "Fill all the fields", DialogType.error);
      }
    } catch (e) {
      Logger().e(e);
      //---stop the loader
      setLoader = false;
    }
  }
}
