import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/fileUploadController.dart';
import 'package:logger/logger.dart';

class HotelRegisterController {
  //---save the user data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference hotelDetails =
      FirebaseFirestore.instance.collection('hotelDetails');

  //------file upload controller object
  final fileUploadController _fileUploadController = fileUploadController();

  //----save extra user data in firestore
  Future<void> saveHotelDetails(
    String hotelName,
    String hotelEmail,
    String hotelPhoneNo,
    String hotelRoomPrice,
    String hotelLocation,
    String hotelDescription,
    File file,
  ) async {
    //--------uploading the selected hotel image in to storage and get the download url
    final String downloadHotelUrl =
        await _fileUploadController.uploadFile(file, "hotelImages");
    if (downloadHotelUrl != "") {
      await hotelDetails.add(
        {
          'hotelName': hotelName,
          'hotelEmail': hotelEmail,
          'hotelPhoneNo': hotelPhoneNo,
          'hotelRoomPrice': hotelRoomPrice,
          'hotelLocation': hotelLocation,
          'hotelDescription': hotelDescription,
          'hotelImg': downloadHotelUrl,
        },
      );
    } else {
      Logger().e("Failed to add Hotel data");
    }
  }
}
