import 'dart:convert';

class hotelCustomerModel {
  String customerPhoneNo;
  dynamic customerCheckIn;
  dynamic customerCheckOut;
  String NoOfGust;
  String uid;
  String name;
  String email;
  String hotelEmail;
  String hotelName;
  String docId;

  hotelCustomerModel(
    this.customerPhoneNo,
    this.customerCheckIn,
    this.customerCheckOut,
    this.NoOfGust,
    this.uid,
    this.name,
    this.email,
    this.hotelEmail,
    this.hotelName,
    this.docId,
  );

  hotelCustomerModel.fromJason(Map<String, dynamic> json)
      : customerPhoneNo = json['customerPhoneNo'],
        customerCheckIn = json['customerCheckIn'],
        customerCheckOut = json['customerCheckOut'],
        NoOfGust = json['NoOfGust'],
        uid = json['uid'],
        name = json['name'],
        email = json['email'],
        hotelEmail = json['hotelEmail'],
        hotelName = json['hotelName'],
        docId = json['docId'];
}
