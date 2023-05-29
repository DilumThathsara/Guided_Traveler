import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:guided_traveler/controllers/admin_Controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class AdminProvider extends ChangeNotifier {
  //---admin contoller object
  final AdminController _adminController = AdminController();
  //---image picker class object
  final ImagePicker _picker = ImagePicker();

  //---product image object
  File _image = File("");

  //---get pick file
  File get image => _image;

  //--select product image
  Future<void> selectImage() async {
    try {
      // Pick an image
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      //---check if the user has picked the file or not
      if (pickedFile != null) {
        Logger().w(pickedFile.path);
        //---assigning the picked file object yo the object
        _image = File(pickedFile.path);

        notifyListeners();
      } else {
        Logger().e('no image selected');
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //---description controler
  final _description = TextEditingController();

  //--- get description controller
  TextEditingController get deseController => _description;

  //---product visiting Place controller
  final _visitingPlaceName = TextEditingController();

  //---product get visiting Place controller
  TextEditingController get visitingPlaceNameController => _visitingPlaceName;

  //----loading state
  bool _isLoading = false;

  //get loader state
  bool get isLoading => _isLoading;

  //-----set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //---start saving product data
  Future<void> stratSavePlaceData() async {
    try {
      //---start the loader
      setLoader = true;
      await _adminController
          .savePlacesData(_visitingPlaceName.text, _description.text, _image)
          .then((value) {
        _visitingPlaceName.clear();
        _description.clear();
        _image = File("");

        notifyListeners();
      });
      //---stop the loader
      setLoader = false;
    } catch (e) {
      Logger().e(e);
      //---stop the loader
      setLoader = false;
    }
  }
}
