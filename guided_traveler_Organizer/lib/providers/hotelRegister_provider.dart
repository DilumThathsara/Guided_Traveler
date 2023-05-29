import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/hotelRegister_Controller.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class hotelRegisterProvider extends ChangeNotifier {
  final HotelRegisterController _hotelRegisterController =
      HotelRegisterController();
  //------image picker class object
  final ImagePicker _hotelImgPicker = ImagePicker();

//------product image object
  File _hotelImage = File("");

//----get picked file
  File get hotelImage => _hotelImage;
//--select product image
  Future<void> selectHotelImage() async {
    try {
      _hotelImage = (await utillFunction.pickImageFromGallry())!;
      //notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  //---name controler
  final _hotelName = TextEditingController();

  //--- get name controller
  TextEditingController get hotelNameController => _hotelName;

  //---email controler
  final _hotelEmail = TextEditingController();

  //--- get email controller
  TextEditingController get hotelEmailController => _hotelEmail;

  //---phone no controler
  final _hotelPhoneNo = TextEditingController();

  //--- get phone no controller
  TextEditingController get hotelPhoneNoController => _hotelPhoneNo;

  //---phone no controler
  final _hotelRoomPrice = TextEditingController();

  //--- get phone no controller
  TextEditingController get hotelRoomPriceController => _hotelRoomPrice;

  //---hotel no controler
  final _hotelLocation = TextEditingController();

  //--- get hotel no controller
  TextEditingController get hotelLocationController => _hotelLocation;

  //---hotel no controler
  final _hotelDescription = TextEditingController();

  //--- get hotel no controller
  TextEditingController get hotelDescriptionController => _hotelDescription;

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> registerHotel() async {
    try {
      //-start the loader
      setLoader = true;
      await _hotelRegisterController
          .saveHotelDetails(
        _hotelName.text,
        _hotelEmail.text,
        _hotelPhoneNo.text,
        _hotelRoomPrice.text,
        _hotelLocation.text,
        _hotelDescription.text,
        _hotelImage,
      )
          .then(
        (value) {
          _hotelName.clear();
          _hotelEmail.clear();
          _hotelPhoneNo.clear();
          _hotelRoomPrice.clear();
          _hotelLocation.clear();
          _hotelDescription.clear();
        },
      );
      //-stop the loader
      setLoader = false;
    } catch (e) {
      //-stop the loader
      setLoader = false;
      Logger().e(e);
    }
  }
}
