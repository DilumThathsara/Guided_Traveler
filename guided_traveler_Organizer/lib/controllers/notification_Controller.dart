import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guided_traveler/models/notification_mode.dart';
import 'package:logger/logger.dart';

class NotificationController {
  //---save the nortification data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called nortification that references the firestore collection
  CollectionReference organiserNotification =
      FirebaseFirestore.instance.collection('organiserNotification');

  //---fetch nortification list from cloudfirestore
  Future<List<notificationModel>> fetchNotificationList() async {
    try {
      //----------------firebase query that find and fetch nortification collection
      QuerySnapshot querySnapshot = await organiserNotification.get();
      Logger().i(querySnapshot.docs.length);

      //---temp nortification list
      List<notificationModel> list = [];

      for (var e in querySnapshot.docs) {
        //---- mapping hotel data in to nortification modul
        notificationModel model =
            notificationModel.fromJason(e.data() as Map<String, dynamic>);

        //--------adding to the nortification list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }
}
