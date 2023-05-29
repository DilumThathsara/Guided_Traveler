class hotelModel {
  String hotelName;
  String hotelEmail;
  String hotelPhoneNo;
  String hotelLocation;
  String hotelRoomPrice;
  String hotelDescription;
  String hotelImg;

  hotelModel(
    this.hotelName,
    this.hotelEmail,
    this.hotelPhoneNo,
    this.hotelLocation,
    this.hotelRoomPrice,
    this.hotelDescription,
    this.hotelImg,
  );

  //-------this named constructor will bind json data to our model
  hotelModel.fromJason(Map<String, dynamic> json)
      : hotelName = json['hotelName'],
        hotelEmail = json['hotelEmail'],
        hotelPhoneNo = json['hotelPhoneNo'],
        hotelLocation = json['hotelLocation'],
        hotelRoomPrice = json['hotelRoomPrice'],
        hotelDescription = json['hotelDescription'],
        hotelImg = json['hotelImg'];
}
