import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/withDriverCustomer_Controller.dart';
import 'package:guided_traveler/models/withDriverCustomer_model.dart';
import 'package:logger/logger.dart';

class WithDriverCustomerProvider extends ChangeNotifier {
  final WithDriverCustomerController _withDriverCustomerController =
      WithDriverCustomerController();

  List<withDriverCustomerModel> _withDtiverCustomerModel = [];
  List<withDriverCustomerModel> get getWithDriverCustomerModel =>
      _withDtiverCustomerModel;

  Future<void> startFetchWithDriverCustomerData(BuildContext context) async {
    try {
      _withDtiverCustomerModel = await _withDriverCustomerController
          .fetchWithDriverCustomerList(context);

      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }
}
