class withOutDriverModel {
  String vehicleName;
  String vehicleType;
  String vehicleNo;
  String vehicleEmail;
  String vehiclePhoneNo;
  String img;

  withOutDriverModel(this.vehicleName, this.vehicleEmail, this.vehiclePhoneNo, this.vehicleType,
      this.vehicleNo, this.img);

  //-------this named constructor will bind json data to our model
  withOutDriverModel.fromJason(Map<String, dynamic> json)
      : vehicleName = json['vehicleName'],
        vehicleEmail = json['vehicleEmail'],
        vehicleType = json['vehicleType'],
        vehiclePhoneNo = json['vehiclePhoneNo'],
        vehicleNo = json['vehicleNo'],
        img = json['img'];
}
