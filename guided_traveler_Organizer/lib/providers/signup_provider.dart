import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:guided_traveler/controllers/auth_Controller.dart';
import 'package:guided_traveler/utils/alert_helper.dart';
import 'package:logger/logger.dart';

class SignupProvider extends ChangeNotifier {
  //---email controler
  final _email = TextEditingController();

  //--- get email controller
  TextEditingController get emailController => _email;

  //---name controller
  final _name = TextEditingController();

  //--- get name controller
  TextEditingController get nameController => _name;

  //---password controller
  final _password = TextEditingController();

  //--- get password controller
  TextEditingController get passwordController => _password;

  //---loading state
  bool _isLoading = false;

  //---get loader state
  bool get isLoading => _isLoading;

  //---set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //----------signup fuction
  Future<void> startSignup(BuildContext context) async {
    try {
      if (_email.text.isNotEmpty &&
          _password.text.isNotEmpty &&
          _name.text.isNotEmpty) {
        //---start the loadero
        setLoader = true;

        //---start creating the user account
        await AuthController()
            .signUpUser(_email.text, _password.text, _name.text, context);

        //---stop the loadero
        setLoader = false;
      } else {
        //-----shows a error dialog
        AlertHelper.showAlert(context, "Validation error",
            "Fill all the fields", DialogType.error);
      }
    } catch (e) {
      Logger().e(e);
      //---stop the loadero
      setLoader = false;
    }
  }
}
