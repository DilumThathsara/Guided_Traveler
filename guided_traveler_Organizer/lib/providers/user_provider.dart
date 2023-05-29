import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:guided_traveler/controllers/auth_Controller.dart';
import 'package:guided_traveler/models/user_model.dart';
import 'package:guided_traveler/models/withDriverCustomer_model.dart';
import 'package:guided_traveler/providers/hotelCustomer_provider.dart';
import 'package:guided_traveler/providers/notification_provider.dart';
import 'package:guided_traveler/providers/withDriverCustomer_Provider.dart';
import 'package:guided_traveler/providers/withOutDriverCustomer_Provider.dart';
import 'package:guided_traveler/screens/auth/signUp.dart';
import 'package:guided_traveler/screens/main/mainScreen.dart';
import 'package:guided_traveler/utils/alert_helper.dart';
import 'package:logger/logger.dart';
import 'package:guided_traveler/utils/util_Functions.dart';
import 'package:provider/provider.dart';

class userProvider extends ChangeNotifier {
  AuthController _authController = AuthController();

  //----initialize the user and listen to the auth state
  Future<void> initializeUser(BuildContext context) async {
    //--check user current auth state
    //-- register this lisnter
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        //--if user is  null, that means the auth state is sign out
        //-- to redeirect the user to signup page
        Logger().i('User is currently signed out!');
        utillFunction.navigateTo(context, const SignUp());
      } else {
        //--if user is not null, that means the auth state is login
        //-- to redeirect the user to home page
        Logger().i('User is signed in!');
        await startFetchUserData(user.uid, context).then(
          (value) {
            Provider.of<hotelCustomerProvider>(context, listen: false)
                .startFetchHotelCustomerData(context);
            Provider.of<WithDriverCustomerProvider>(context, listen: false)
                .startFetchWithDriverCustomerData(context);
            Provider.of<WithOutDriverCustomerProvider>(context, listen: false)
                .startFetchWithOutDriverCustomerData(context);
            Provider.of<NotificationProvider>(context, listen: false)
                .startFetchNotificationData();

            utillFunction.navigateTo(context, const MainScreen());
          },
        );
      }
    });
  }

  //---start fetch user data ----------
  //-- store fetch user model
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  Future<void> startFetchUserData(String uid, BuildContext context) async {
    try {
      await _authController.fetchUserData(uid).then(
        (value) {
          //--check if fetch result is not null
          if (value != null) {
            _userModel = value;
            notifyListeners();
          } else {
            //--show an error
            AlertHelper.showAlert(context, "Error",
                "Error while fetching user data", DialogType.error);
          }
        },
      );
    } catch (e) {
      Logger().e(e);
    }
  }
}
