class UserModel {
  String uid;
  String email;
  String name;
  String img;

  UserModel(this.uid, this.email, this.name, this.img);

  //-------this named constructor will bind json data to our model
  UserModel.fromJason(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'],
        email = json['email'],
        img = json['img'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'img': img,
      };
}
