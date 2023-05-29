class withOutDriverCustomerModel {
  dynamic withOutDriverCustomerPickOut;
  dynamic withOutDriverCustomerPickUp;
  String withOutDriverCustomerPickUpLocation;
  String withOutDriverCustomerWhatsappNo;
  String uid;
  String name;
  String email;
  String vehicleNo;
  String vehicleEmail;
  String vehicleName;

  withOutDriverCustomerModel(
    this.withOutDriverCustomerPickOut,
    this.withOutDriverCustomerPickUp,
    this.withOutDriverCustomerPickUpLocation,
    this.withOutDriverCustomerWhatsappNo,
    this.uid,
    this.name,
    this.email,
    this.vehicleNo,
    this.vehicleEmail,
    this.vehicleName,
  );

  withOutDriverCustomerModel.fromJason(Map<String, dynamic> json)
      : withOutDriverCustomerPickOut = json['withOutDriverCustomerPickOut'],
        withOutDriverCustomerPickUp = json['withOutDriverCustomerPickUp'],
        withOutDriverCustomerPickUpLocation =
            json['withOutDriverCustomerPickUpLocation'],
        withOutDriverCustomerWhatsappNo =
            json['withOutDriverCustomerWhatsappNo'],
        uid = json['uid'],
        name = json['name'],
        email = json['email'],
        vehicleNo = json['vehicleNo'],
        vehicleEmail = json['vehicleEmail'],
        vehicleName = json['vehicleName'];
}
