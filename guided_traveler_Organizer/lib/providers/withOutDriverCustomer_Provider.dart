import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/withDriverCustomer_Controller.dart';
import 'package:guided_traveler/controllers/withOutDriverCustomer_Controller.dart';
import 'package:guided_traveler/models/withDriverCustomer_model.dart';
import 'package:guided_traveler/models/withOutDriverCustomer_model.dart';
import 'package:logger/logger.dart';

class WithOutDriverCustomerProvider extends ChangeNotifier {
  final WithOutDriverCustomerController _withOutDriverCustomerController =
      WithOutDriverCustomerController();

  List<withOutDriverCustomerModel> _withOutDriverCustomerModel = [];
  List<withOutDriverCustomerModel> get getWithOutDriverCustomerModel =>
      _withOutDriverCustomerModel;

  Future<void> startFetchWithOutDriverCustomerData(BuildContext context) async {
    try {
      _withOutDriverCustomerModel = await _withOutDriverCustomerController
          .fetchWithOutDriverCustomerList(context);

      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }
}
