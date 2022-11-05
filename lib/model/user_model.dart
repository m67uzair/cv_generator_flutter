class UserModel {
  int id;
  String name;
  String contact;
  String location;
  String email;
  String designation;
  List experienceList;
  List educationList;
  List skillList;
  List workList;
  List linkList;
  List language;
  dynamic image;

  UserModel(
      {required this.linkList,
      required this.skillList,
      required this.educationList,
      required this.experienceList,
      required this.designation,
      required this.name,
      required this.email,
      required this.contact,
      required this.location,
      required this.language,
      required this.workList,
      required this.id,
      required this.image});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contact': contact,
      'location': location,
      'email': email,
      'designation': designation,
      'experience': experienceList,
      'education': educationList,
      'skill': skillList,
      'work': workList,
      'link': linkList,
      'language': language,
      'id': id,
      'image': image,
    };
  }
}
