import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guided_traveler/models/hotel_model.dart';
import 'package:guided_traveler/utils/alert_helper.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guided_traveler/controllers/fileUploadController.dart';

class HotelBookingController {
  //---save the hotel booking data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called hotel booking that references the firestore collection
  CollectionReference hotelDetails =
      FirebaseFirestore.instance.collection('hotelDetails');

  //---fetch hotel list from cloudfirestore
  Future<List<hotelModel>> fetchHotelList() async {
    try {
      //----------------firebase query that find and fetch hotel collection
      QuerySnapshot querySnapshot = await hotelDetails.get();
      Logger().i(querySnapshot.docs.length);

      //---temp hotel list
      List<hotelModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping hotel data in to driver modul
        hotelModel model =
            hotelModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the hotel list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference hotelBookingDetails =
      FirebaseFirestore.instance.collection('hotelBookingDetails');

  //----save extra user data in firestore
  Future<void> saveHotelBooking(
      String customerPhoneNo,
      dynamic customerCheckIn,
      dynamic customerCheckOut,
      String NoOfGust,
      String uid,
      String name,
      String email,
      String hotelEmail,
      String hotelName) {
    String docId = hotelBookingDetails.doc().id;
    return hotelBookingDetails
        .doc(docId)
        .set(
          {
            'customerPhoneNo': customerPhoneNo,
            'customerCheckIn': customerCheckIn,
            'customerCheckOut': customerCheckOut,
            'NoOfGust': NoOfGust,
            'uid': uid,
            'name': name,
            'email': email,
            'hotelEmail': hotelEmail,
            'hotelName': hotelName,
            'docId': docId,
          },
        )
        .then((value) => Logger().i("Successfully added"))
        .catchError(
          (error) {
            Logger().e("Failed to merge data: $error");
          },
        );
  }
}
