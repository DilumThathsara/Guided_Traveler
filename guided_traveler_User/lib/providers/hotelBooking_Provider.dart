import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/hotelBooking_Controller.dart';
import 'package:guided_traveler/screens/main/home/home_page.dart';
import 'package:guided_traveler/utils/alert_helper.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:logger/logger.dart';

class HotelBookingProvider extends ChangeNotifier {
  final HotelBookingController _hotelBookingController =
      HotelBookingController();

  //---customer phone no controler
  final _customerPhoneNo = TextEditingController();

  //--- get customer phone no controller
  TextEditingController get customerPhoneNoController => _customerPhoneNo;

  //---customer check in controler
  TextEditingController customerCheckIn = TextEditingController();

  //--- get customer phone no controller
  TextEditingController get customerCheckInController => customerCheckIn;

  //---customer check out controler
  TextEditingController customerCheckOut = TextEditingController();

  //--- get customer phone no controller
  TextEditingController get customerCheckOutController => customerCheckOut;

  //---customer No OF Gust controler
  final _NoOfGust = TextEditingController();

  //--- get customer phone no controller
  TextEditingController get NoOfGustController => _NoOfGust;

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //---start saving hotel data
  Future<void> stratSaveHotelBooking(String uid, String name, String email,
      String hotelEmail, String hotelName, BuildContext context) async {
    try {
      if (_customerPhoneNo.text.isNotEmpty &&
          customerCheckIn.text.isNotEmpty &&
          customerCheckOut.text.isNotEmpty &&
          _NoOfGust.text.isNotEmpty) {
        //---start the loader
        setLoader = true;
        await _hotelBookingController
            .saveHotelBooking(
          _customerPhoneNo.text,
          customerCheckIn.text,
          customerCheckOut.text,
          _NoOfGust.text,
          uid,
          name,
          email,
          hotelEmail,
          hotelName,
        )
            .then(
          (value) {
            _customerPhoneNo.clear();
            customerCheckIn.clear();
            customerCheckOut.clear();
            _NoOfGust.clear();
            AlertHelper.showAlert(
                context, "Booking successfully", '', DialogType.success);

            notifyListeners();
          },
        );

        //---stop the loader
        setLoader = false;
      } else {
        //-----shows a error dialog
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
