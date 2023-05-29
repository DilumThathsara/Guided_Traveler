class notificationModel {
  String notiTopic;
  String notiSpecialFor;
  String notiMassage;

  notificationModel(
    this.notiTopic,
    this.notiSpecialFor,
    this.notiMassage,
  );

  notificationModel.fromJason(Map<String, dynamic> json)
      : notiTopic = json["notiTopic"],
        notiSpecialFor = json["notiSpecialFor"],
        notiMassage = json["notiMassage"];
}
