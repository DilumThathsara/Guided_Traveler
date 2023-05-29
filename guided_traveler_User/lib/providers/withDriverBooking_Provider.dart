import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/withDriverBooking_Controller.dart';
import 'package:guided_traveler/utils/alert_helper.dart';
import 'package:logger/logger.dart';

class WithDriverBookingProvider extends ChangeNotifier {
  final WithDriverBookingContoller _withDriverBookingContoller =
      WithDriverBookingContoller();

  //---vehicle customer phone no controler
  final _withDriverCustomerPickUpLocation = TextEditingController();

  //--- get vehicle customer phone no controller
  TextEditingController get withDriverCustomerPickUpLocationController =>
      _withDriverCustomerPickUpLocation;

  //---vehicle customer phone no controler
  final _withDriverCustomerWhatsappNo = TextEditingController();

  //--- get vehicle customer phone no controller
  TextEditingController get withDriverCustomerPhoneNoController =>
      _withDriverCustomerWhatsappNo;

  //---vehicle customer check in controler
  TextEditingController withDriverCustomerPickUp = TextEditingController();

  //--- get vehicle customer phone no controller
  TextEditingController get withDriverCustomerPickUpController =>
      withDriverCustomerPickUp;

  //---vehicle customer check out controler
  TextEditingController withDriverCustomerPickOut = TextEditingController();

  //--- get vehicle customer phone no controller
  TextEditingController get withDriverCustomerPickOutController =>
      withDriverCustomerPickOut;

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
  Future<void> stratSavewithDriverVehicleBooking(
      String uid,
      String name,
      String email,
      String vehicleName,
      String vehicleEmail,
      String vehicleNo,
      BuildContext context) async {
    try {
      if (_withDriverCustomerPickUpLocation.text.isNotEmpty &&
          _withDriverCustomerWhatsappNo.text.isNotEmpty &&
          withDriverCustomerPickUp.text.isNotEmpty &&
          withDriverCustomerPickOut.text.isNotEmpty) {
        //---start the loader
        setLoader = true;
        await _withDriverBookingContoller
            .saveWithDriverBooking(
                _withDriverCustomerPickUpLocation.text,
                _withDriverCustomerWhatsappNo.text,
                withDriverCustomerPickUp.text,
                withDriverCustomerPickOut.text,
                uid,
                name,
                email,
                vehicleName,
                vehicleEmail,
                vehicleNo)
            .then(
          (value) {
            _withDriverCustomerPickUpLocation.clear();
            _withDriverCustomerWhatsappNo.clear();
            withDriverCustomerPickUp.clear();
            withDriverCustomerPickOut.clear();
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
      AlertHelper.showAlert(
          context, "Booking error", "Fill all the fields", DialogType.error);
      Logger().e(e);
      //---stop the loader
      setLoader = false;
    }
  }
}
