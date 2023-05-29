import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class utillFunction {
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  //navigator pop function
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  //--select places image
  static Future<File?> pickImageFromGallry() async {
    try {
      File _image = File("");
      // Pick an image
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      //---check if the user has picked the file or not
      if (pickedFile != null) {
        //---assigning the picked file object yo the object
        _image = File(pickedFile.path);

        return _image;
      } else {
        Logger().e('no image selected');
      }
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
