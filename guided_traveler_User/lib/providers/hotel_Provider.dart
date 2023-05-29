import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/hotelBooking_Controller.dart';
import 'package:guided_traveler/models/hotel_model.dart';
import 'package:logger/logger.dart';

class HotelProvider extends ChangeNotifier {
  HotelBookingController _hotelBookingController = HotelBookingController();

  //---start fetch hotel data ----------
  //-- store fetch hotel model
  List<hotelModel> _hotelModel = [];
  List<hotelModel> get hotelsModel => _hotelModel;

  Future<void> startFetchHotelData() async {
    try {
      _hotelModel = await _hotelBookingController.fetchHotelList();
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  //-------to store selected
  late hotelModel _tempHotelModel;

  hotelModel get gethotelModel => _tempHotelModel;

  //set product model when clicked on the product tile
  set setHotel(hotelModel model) {
    _tempHotelModel = model;
    notifyListeners();
  }
}
