import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  List experienceList = [
    // {
    //   "companyName": "Mehran University Of Engineering And Technology Jamshoro",
    //   "occupation": "Teacher",
    //   "from": "2000/4/30",
    //   "to": "2022/10/21"
    // }
  ];

  List educationList = [
    {
      "instituteName":
          "Mehran University Of Engineering And Technology Jamshoro",
      "course": "MBBS",
      "from": "2000/4/30",
      "to": "2022/10/21"
    }
  ];

  void addExperience(
      {required String companyName,
      required String occupation,
      required String fromDate,
      required String toDate}) {
    experienceList.add({
      "companyName": companyName,
      "occupation": occupation,
      "from": fromDate,
      "to": toDate
    });

    notifyListeners();
  }

  void updateExperience(
      {required String companyName,
      required String occupation,
      required String fromDate,
      required String toDate,
      required int index}) {
    experienceList[index] = {
      "companyName": companyName,
      "occupation": occupation,
      "from": fromDate,
      "to": toDate
    };

    notifyListeners();
  }

  void addEducation(
      {required String instituteName,
      required String course,
      required String fromDate,
      required String toDate}) {
    educationList.add({
      "instituteName": instituteName,
      "course": course,
      "from": fromDate,
      "to": toDate
    });

    notifyListeners();
  }
}
