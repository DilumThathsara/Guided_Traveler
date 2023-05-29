import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guided_traveler/controllers/fileUploadController.dart';
import 'package:logger/logger.dart';

class AdminController {
  //---save the user data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference places = FirebaseFirestore.instance.collection('places');

  //---file upload controller object
  final fileUploadController _fileUploadController = fileUploadController();

  //----save extra place data in firestore
  Future<void> savePlacesData(String placesName, String desc, File file) async {
    //---uploading the selected product image in storage and get the download url
    final String downloadUrl =
        await _fileUploadController.uploadFile(file, "placesImage");
    if (downloadUrl != "") {
      await places
          .add(
            {'placesName': placesName, 'desc': desc, 'img': downloadUrl},
          )
          .then((value) => Logger().i("Successfully added"))
          .catchError((error) => Logger().e("Failed to merge data: $error"));
    } else {
      Logger().e("Something went wrong");
    }
  }
}
