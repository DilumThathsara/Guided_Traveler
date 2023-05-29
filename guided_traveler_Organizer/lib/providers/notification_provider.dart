import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/notification_Controller.dart';
import 'package:guided_traveler/models/notification_mode.dart';

import 'package:logger/logger.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationController _notificationProvider = NotificationController();

  //---start fetch notification data ----------
  //-- store fetch notification model
  List<notificationModel> _notificationModel = [];
  List<notificationModel> get notificatiosnModel => _notificationModel;

  Future<void> startFetchNotificationData() async {
    try {
      _notificationModel = await _notificationProvider.fetchNotificationList();
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  // //-------to store selected
  // late notificationModel _tempnotificationModel;

  // notificationModel get getNotificationModel => _tempnotificationModel;

  // //set product model when clicked on the product tile
  // set setHotel(notificationModel model) {
  //   _tempnotificationModel = model;
  //   notifyListeners();
  // }
}
