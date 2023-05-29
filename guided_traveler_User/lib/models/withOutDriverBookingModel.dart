import 'dart:convert';

class withOutDriverBookingModel {
  String withDriverPickUpLocation;
  String withDriverCustomPhoneNo;
  String withDriverCheckIn;
  String withDriverCheckOut;
  String docId;

  withOutDriverBookingModel(
    this.withDriverPickUpLocation,
    this.withDriverCustomPhoneNo,
    this.withDriverCheckIn,
    this.withDriverCheckOut,
    this.docId,
  );

  withOutDriverBookingModel.fromJason(Map<String, dynamic> json)
      : withDriverPickUpLocation = json['withDriverPickUpLocation'],
        withDriverCustomPhoneNo = json['withDriverCustomPhoneNo'],
        withDriverCheckIn = json['withDriverCheckIn'],
        withDriverCheckOut = json['withDriverCheckOut'],
        docId = json['docId'];
}
