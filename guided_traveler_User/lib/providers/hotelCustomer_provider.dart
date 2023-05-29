import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/hotelCustomer_Controller.dart';
import 'package:guided_traveler/models/hotelCustomer_model.dart';
import 'package:logger/logger.dart';

class hotelCustomerProvider extends ChangeNotifier {
  final HotelCustomerController _hotelCustomerController =
      HotelCustomerController();

  List<hotelCustomerModel> _hotelCustomerModel = [];
  List<hotelCustomerModel> get getHotelCustomerModel => _hotelCustomerModel;

  Future<void> startFetchHotelCustomerData(BuildContext context) async {
    try {
      _hotelCustomerModel =
          await _hotelCustomerController.fetchWithHotelCustomerList(context);

      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }
}
