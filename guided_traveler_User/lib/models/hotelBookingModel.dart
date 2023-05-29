import 'package:guided_traveler/screens/main/map/map_Screen.dart';

class hotelBookingModel {
  String hotelCustomPhoneNo;
  String hotelCheckIn;
  String hotelCheckOut;
  String hotelNoOfGust;

  hotelBookingModel(
    this.hotelCustomPhoneNo,
    this.hotelCheckIn,
    this.hotelCheckOut,
    this.hotelNoOfGust,
  );

  hotelBookingModel.fromJason(Map<String, dynamic> json)
      : hotelCustomPhoneNo = json['hotelCustomPhoneNo'],
        hotelCheckIn = json['hotelCheckIn'],
        hotelCheckOut = json['hotelCheckOut'],
        hotelNoOfGust = json['hotelNoOfGust'];
}
