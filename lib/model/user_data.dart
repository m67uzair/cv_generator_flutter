import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserData extends ChangeNotifier {
  late dynamic image;

  UserPersonalInfo info = UserPersonalInfo(
      designation: '', name: '', location: '', email: '', contact: '');
  List experienceList = [
    // {
    //   "companyName": "Mehran University Of Engineering And Technology Jamshoro",
    //   "occupation": "Teacher",
    //   "from": "2000/4/30",
    //   "to": "2022/10/21"
    // }
  ];

  List educationList = [
    // {
    //   "instituteName":
    //       "Mehran University Of Engineering And Technology Jamshoro",
    //   "course": "MBBS",
    //   "from": "2000/4/30",
    //   "to": "2022/10/21"
    // }
  ];

  List projectsList = [
    // {
    //   "instituteName":
    //       "Mehran University Of Engineering And Technology Jamshoro",
    //   "course": "MBBS",
    //   "from": "2000/4/30",
    //   "to": "2022/10/21"
    // }
  ];

  List languageList = [];
  List linkList = [];
  List skillList = [];

  void addProjects(
      {required String name,
      required String remarks,
      required String fromDate,
      required String toDate}) {
    projectsList.add({
      "projectName": name,
      "remarks": remarks,
      "from": fromDate,
      "to": toDate
    });

    notifyListeners();
  }

  void updateProjects(
      {required String name,
      required String remarks,
      required String fromDate,
      required String toDate,
      required int index}) {
    projectsList[index] = {
      "projectName": name,
      "remarks": remarks,
      "from": fromDate,
      "to": toDate
    };
    notifyListeners();
  }

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

  void addSkill({
    required String skill,
  }) {
    skillList.add(skill);

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

  void updateEducation(
      {required String instituteName,
      required String course,
      required String fromDate,
      required String toDate,
      required int index}) {
    experienceList[index] = {
      "instituteName": instituteName,
      "course": course,
      "from": fromDate,
      "to": toDate
    };

    notifyListeners();
  }

  void addLanguages({
    required String language,
  }) {
    languageList.add(language);

    notifyListeners();
  }

  // void updateLanguage(
  //     {required String language,
  //       }) {
  //   projectsList[index] = {
  //     "projectName": name,
  //     "remarks": remarks,
  //     "from": fromDate,
  //     "to": toDate
  //   };
  //   notifyListeners();
  // }

  void addLinks({
    required String url,
  }) {
    if (url.contains('linkedin')) {
      linkList.add(Link(icon: FontAwesomeIcons.linkedin, url: url));
    }
    if (url.contains('facebook')) {
      linkList.add(Link(icon: FontAwesomeIcons.facebook, url: url));
    }
    if (url.contains('instagram')) {
      linkList.add(Link(icon: FontAwesomeIcons.instagram, url: url));
    }
    if (url.contains('github')) {
      linkList.add(Link(icon: FontAwesomeIcons.github, url: url));
    }
    if (url.contains('twitter')) {
      linkList.add(Link(icon: FontAwesomeIcons.twitter, url: url));
    }
    if (url.contains('stackoverflow')) {
      linkList.add(Link(icon: FontAwesomeIcons.stackOverflow, url: url));
    }
    if (url.contains('hackerrank')) {
      linkList.add(Link(icon: FontAwesomeIcons.hackerrank, url: url));
    }
    if (url.contains('youtube')) {
      linkList.add(Link(icon: FontAwesomeIcons.youtube, url: url));
    } else {
      linkList.add(Link(icon: FontAwesomeIcons.link, url: url));
    }

    notifyListeners();
  }

  void updateLinks({required String url, required int index}) {
    experienceList[index] = url;

    notifyListeners();
  }
}

class Link {
  String url;
  IconData icon;

  Link({required this.icon, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'icon': icon.toString(),
    };
  }
}

class UserPersonalInfo {
  String name;
  String location;
  String contact;
  String email;
  String designation;

  UserPersonalInfo(
      {required this.designation,
      required this.name,
      required this.location,
      required this.email,
      required this.contact});
}
