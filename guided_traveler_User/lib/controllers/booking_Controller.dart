import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guided_traveler/controllers/fileUploadController.dart';
import 'package:guided_traveler/models/with_driver_model.dart';
import 'package:guided_traveler/models/without_driver_model.dart';
import 'package:guided_traveler/screens/vehicleBooking/with_Driver.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:logger/logger.dart';

class BookingController {
  //---save the user data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference withDrivers =
      FirebaseFirestore.instance.collection('withDrivers');

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference withOutDrivers =
      FirebaseFirestore.instance.collection('withOutDrivers');

  //---fetch driver list from cloudfirestore
  Future<List<withDriverModel>> fetchWithDriverList() async {
    try {
      //----------------firebase query that find and fetch WithDriver collection
      QuerySnapshot querySnapshot = await withDrivers.get();
      Logger().i(querySnapshot.docs.length);

      //---temp driver list
      List<withDriverModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping driver data in to driver modul
        withDriverModel model =
            withDriverModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the driver list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //---fetch driver list from cloudfirestore
  Future<List<withOutDriverModel>> fetchWithOutDriverList() async {
    try {
      //----------------firebase query that find and fetch WithDriver collection
      QuerySnapshot querySnapshot = await withOutDrivers.get();
      Logger().i(querySnapshot.docs.length);

      //---temp driver list
      List<withOutDriverModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping driver data in to driver modul
        withOutDriverModel model =
            withOutDriverModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the driver list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }
}
