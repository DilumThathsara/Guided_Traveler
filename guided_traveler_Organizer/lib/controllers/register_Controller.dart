import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guided_traveler/controllers/fileUploadController.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';
import 'package:logger/logger.dart';

class RegisterController {
  //---save the user data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference vehicleDetails =
      FirebaseFirestore.instance.collection('vehicleDetails');

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference withDrivers =
      FirebaseFirestore.instance.collection('withDrivers');

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference withOutDrivers =
      FirebaseFirestore.instance.collection('withOutDrivers');

  //------file upload controller object
  final fileUploadController _fileUploadController = fileUploadController();

  //----save extra user data in firestore
  Future<void> saveDriverDetails(
    String vehicleName,
    String vehicleEmail,
    String vehiclePhoneNo,
    String vehicleNo,
    bool withDriver,
    bool withOutDriver,
    String vehicleType,
    File file,
  ) async {
    //--------uploading the selected veicle image in to storage and get the download url
    final String downloadUrl =
        await _fileUploadController.uploadFile(file, "vehicleImages");
    if (downloadUrl != "") {
      await vehicleDetails
          .add(
            {
              'vehicleName': vehicleName,
              'vehicleEmail': vehicleEmail,
              'vehiclePhoneNo': vehiclePhoneNo,
              'vehicleNo': vehicleNo,
              'withDriver': withDriver,
              'withOutDriver': withOutDriver,
              'vehicleType': vehicleType,
              'img': downloadUrl,
            },
          )
          .then(
            (value) {
              if (withDriver == true) {
                withDrivers.add(
                  {
                    'vehicleName': vehicleName,
                    'vehicleEmail': vehicleEmail,
                    'vehiclePhoneNo': vehiclePhoneNo,
                    'vehicleNo': vehicleNo,
                    'withDriver': withDriver,
                    'withOutDriver': withOutDriver,
                    'vehicleType': vehicleType,
                    'img': downloadUrl,
                  },
                );
              }
            },
          )
          .then((value) {
            if (withOutDriver == true) {
              withOutDrivers.add(
                {
                  'vehicleName': vehicleName,
                  'vehicleEmail': vehicleEmail,
                  'vehiclePhoneNo': vehiclePhoneNo,
                  'vehicleNo': vehicleNo,
                  'withDriver': withDriver,
                  'withOutDriver': withOutDriver,
                  'vehicleType': vehicleType,
                  'img': downloadUrl,
                },
              );
            }
          })
          .then((value) => Logger().i("Successfully added"))
          .catchError((error) => Logger().e("Failed to merge data: $error"));
    } else {
      Logger().e("Failed to add data");
    }
  }
}
