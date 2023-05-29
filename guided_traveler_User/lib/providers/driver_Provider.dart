import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:guided_traveler/controllers/booking_Controller.dart';
import 'package:guided_traveler/models/with_driver_model.dart';
import 'package:guided_traveler/models/without_driver_model.dart';
import 'package:guided_traveler/utils/alert_helper.dart';
import 'package:logger/logger.dart';

class DriverProvider extends ChangeNotifier {
  BookingController _bookingController = BookingController();
  //---start fetch user data ----------
  //-- store fetch user model
  List<withDriverModel> _withDriverModel = [];
  List<withDriverModel> get withDriversModel => _withDriverModel;

  List<withOutDriverModel> _withOutDriverModel = [];
  List<withOutDriverModel> get withOutDriversModel => _withOutDriverModel;

  Future<void> startFetchVehicleData() async {
    try {
      _withDriverModel = await _bookingController.fetchWithDriverList();
      _withOutDriverModel = await _bookingController.fetchWithOutDriverList();
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  //-------to store selected
  late withDriverModel _tempwithDriverModel;

  withDriverModel get getWithDriverModel => _tempwithDriverModel;

  //set product model when clicked on the product tile
  set setWithDriverVehicle(withDriverModel model) {
    _tempwithDriverModel = model;
    notifyListeners();
  }

  //-------to store selected
  late withOutDriverModel _tempwithOutDriverModel;

  withOutDriverModel get getWithOutDriverModel => _tempwithOutDriverModel;

  //set product model when clicked on the product tile
  set setWithOutDriverVehicle(withOutDriverModel model) {
    _tempwithOutDriverModel = model;
    notifyListeners();
  }
}
