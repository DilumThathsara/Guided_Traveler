import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:guided_traveler/controllers/register_Controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class registerProvider extends ChangeNotifier {
  final RegisterController _registerController = RegisterController();
  //------image picker class object
  final ImagePicker _picker = ImagePicker();

//------product image object
  File _image = File("");

  //----get picked file
  File get image => _image;
  //--select product image
  Future<void> selectImage() async {
    try {
      _image = (await utillFunction.pickImageFromGallry())!;
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  //---name controler
  final _vehicleName = TextEditingController();

  //--- get name controller
  TextEditingController get vehicleNameController => _vehicleName;

  //---email controler
  final _vehicleEmail = TextEditingController();

  //--- get email controller
  TextEditingController get vehicleEmailController => _vehicleEmail;
  //---phone no controler
  final _vehiclePhoneNo = TextEditingController();

  //--- get phone no controller
  TextEditingController get vehiclePhoneNoController => _vehiclePhoneNo;

  //---vehicle no controler
  final _vehicleNo = TextEditingController();

  //--- get vehicle no controller
  TextEditingController get vehicleNoController => _vehicleNo;

  //---with Driver no controler
  bool _withDriver = false;

  //--- get with Driver no controller
  bool get withDriver => _withDriver;

  set setwithDriver(bool value) {
    _withDriver = value;
    notifyListeners();
  }

  //---with out Driver no controler
  bool _withOutDriver = false;

  //--- get with out Driver no controller
  bool get withOutDriver => _withOutDriver;

  set setwithOutDriver(bool value) {
    _withOutDriver = value;
    notifyListeners();
  }

  //---vehicle type no controler
  String _vehicleType = '';

  //--- get vehicle type no controller
  String get vehicleType => _vehicleType;

  //----set vehicle Type
  set setVehicleType(String value) {
    _vehicleType = value;
    notifyListeners();
  }

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> registerVehicle(BuildContext context) async {
    try {
      //-start the loader
      setLoader = true;
      await _registerController
          .saveDriverDetails(
        _vehicleName.text,
        _vehicleEmail.text,
        _vehiclePhoneNo.text,
        _vehicleNo.text,
        _withDriver,
        _withOutDriver,
        _vehicleType,
        _image,
      )
          .then((value) {
        //--clean values
        _vehicleName.clear();
        _vehicleEmail.clear();
        _vehiclePhoneNo.clear();
        _vehicleNo.clear();
        _withDriver = false;
        _withOutDriver = false;
        _vehicleType;
      });
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.rectangle(
        'Success',
        'Vehicle registration is success',
        type: AnimatedSnackBarType.success,
        brightness: Brightness.dark,
      ).show(
        context,
      );

      //-stop the loader
      setLoader = false;
    } catch (e) {
      AnimatedSnackBar.rectangle(
        'Success',
        'Vehicle registration is success',
        type: AnimatedSnackBarType.error,
        brightness: Brightness.dark,
      ).show(
        context,
      );
      //-stop the loader
      setLoader = false;
      Logger().e(e);
    }
  }
}
