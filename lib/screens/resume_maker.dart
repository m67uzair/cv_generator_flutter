import 'dart:io';
import 'package:cv_generator/helper/database_helper.dart';
import 'package:cv_generator/model/user_data.dart';
import 'package:cv_generator/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../components/constants.dart';
import '../components/contact_section.dart';
import '../components/education_section.dart';
import '../components/experience_section.dart';
import '../components/link_section.dart';
import '../components/skill_section.dart';
import '../components/work_section.dart';

class ResumeMaker extends StatelessWidget {
  ResumeMaker({Key? key, this.userData}) : super(key: key);
  UserModel? userData = null;
  ScreenshotController screenshotController = ScreenshotController();
  XFile? image;
  bool isOldData = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<UserData>(builder: (context, user, child) {
      if (userData != null) {
        isOldData = true;
        user.image = File(userData!.image);
        user.languageList = userData!.language;
        user.projectsList = userData!.workList;
        user.info.location = userData!.location;
        user.info.contact = userData!.contact;
        user.info.email = userData!.email;
        user.info.name = userData!.name;
        user.info.designation = userData!.designation;
        user.experienceList = userData!.experienceList;
        user.educationList = userData!.educationList;
        user.skillList = userData!.skillList;
        user.linkList = List.generate(
            userData!.linkList.length,
            (index) => Link(
                icon: IconData(
                    int.parse(
                        '0x${userData!.linkList[index]['icon'].substring(11, 16)}'),
                    fontFamily: 'FontAwesomeIcons'),
                url: userData!.linkList[index]['url']));
      }
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Screenshot(
                controller: screenshotController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: Image.file(
                                user.image,
                                fit: BoxFit.cover,
                              ).image,
                              radius: 32,
                            ),
                            Text(
                              user.info.name,
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(user.info.designation,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        ContactSection(
                          size: size,
                          user: user,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        ExperienceSection(
                          size: size,
                          user: user,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        EductionSection(size: size, user: user),
                        const SizedBox(
                          height: 8,
                        ),
                        SkillSection(size: size, user: user),
                        const SizedBox(
                          height: 8,
                        ),
                        WorkSection(size: size, user: user),
                        const SizedBox(
                          height: 8,
                        ),
                        LinkSection(size: size, user: user),
                        const SizedBox(
                          height: 8,
                        ),
                        //LanguageSection(size: size, user: user),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton.extended(
                  heroTag: 'btn1',
                  backgroundColor: Colors.amberAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              FloatingActionButton.extended(
                heroTag: 'btn2',
                backgroundColor: Colors.amberAccent,
                onPressed: () async {
                  // print('hello');
                  if (!isOldData) {
                    await DatabaseHelper.db.insert(UserModel(
                        linkList: user.linkList.map((e) => e.toMap()).toList(),
                        skillList: user.skillList,
                        educationList: user.educationList,
                        experienceList: user.experienceList,
                        designation: user.info.designation,
                        name: user.info.name,
                        email: user.info.email,
                        contact: user.info.contact,
                        location: user.info.location,
                        language: user.languageList,
                        workList: user.projectsList,
                        id: 1,
                        image: user.image.path));
                  }
                  // print(id);
                  // //  await DatabaseHelper.db.deleteAll();
                  // final map = await DatabaseHelper.db.retriveAll();
                  // print(map);

                  // final data = await DatabaseHelper.db.retriveById(14);
                  // print(data);
                  //_takeScreenshot.call();
                  screenshotController
                      .capture(delay: const Duration(milliseconds: 200))
                      .then((capturedImage) async {
                    screenToPdf('myfile', capturedImage!, context);
                    // ShowCapturedWidget(context, capturedImage!);
                  }).catchError((onError) {
                    if (kDebugMode) {
                      print(onError);
                    }
                  });

                  Navigator.pushNamed(context, '/homeScreen');
                  // shareImage() async {
                  //   final uint8List = await screenshotController.capture();
                  //   String tempPath = (await getTemporaryDirectory()).path;
                  //   String fileName = 'pic';
                  //   File file = await File('$tempPath/$fileName" }.png').create();
                  //   file.writeAsBytesSync(uint8List!);
                  //   //   await Share.shareFiles([file.path]);
                  // }
                },
                label: const Text(
                  'Create Resume',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
