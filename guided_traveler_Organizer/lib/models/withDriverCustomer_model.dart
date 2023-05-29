import 'dart:convert';

class withDriverCustomerModel {
  dynamic withDriverCustomerPickOut;
  dynamic withDriverCustomerPickUp;
  String withDriverCustomerPickUpLocation;
  String withDriverCustomerWhatsappNo;
  String uid;
  String name;
  String email;
  String vehicleEmail;
  String vehicleName;
  String vehicleNo;
  String docId;

  withDriverCustomerModel(
      this.withDriverCustomerPickOut,
      this.withDriverCustomerPickUp,
      this.withDriverCustomerPickUpLocation,
      this.withDriverCustomerWhatsappNo,
      this.uid,
      this.name,
      this.email,
      this.vehicleEmail,
      this.vehicleName,
      this.vehicleNo,
      this.docId);

  withDriverCustomerModel.fromJason(Map<String, dynamic> json)
      : withDriverCustomerPickOut = json['withDriverCustomerPickOut'],
        withDriverCustomerPickUp = json['withDriverCustomerPickUp'],
        withDriverCustomerPickUpLocation =
            json['withDriverCustomerPickUpLocation'],
        withDriverCustomerWhatsappNo = json['withDriverCustomerWhatsappNo'],
        uid = json['uid'],
        name = json['name'],
        email = json['email'],
        vehicleEmail = json['vehicleEmail'],
        vehicleName = json['vehicleName'],
        vehicleNo = json['vehicleNo'],
        docId = json['docId'];
}
