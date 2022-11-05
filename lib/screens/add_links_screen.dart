import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../model/user_data.dart';

class AddLinksScreen extends StatefulWidget {
  const AddLinksScreen({super.key});

  @override
  State<AddLinksScreen> createState() => _AddLinksScreenState();
}

class _AddLinksScreenState extends State<AddLinksScreen> {
  TextEditingController linkController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool floatingButtonFlag = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, user, child) {
      if (user.linkList.isNotEmpty) floatingButtonFlag = true;
      return Scaffold(
        appBar: AppBar(title: const Text("Add Links")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      "Link",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    // maxLines: 10,
                    controller: linkController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input link';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    )),
                  ),
                  const SizedBox(height: 64),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          user.addLinks(
                            url: linkController.text,
                          );
                          linkController.clear();
                          floatingButtonFlag = true;
                        }

                        // languageController.clear();
                        // Navigator.pushNamed(context, '/personalInfoScreen');
                      },
                      style: ElevatedButton.styleFrom(
                          //  maximumSize: Size(MediaQuery.of(context).size.width, 80),
                          //  minimumSize: Size(MediaQuery.of(context).size.width, 40),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8)),
                      child: const Text(
                        'Add Link',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  if (user.linkList.isNotEmpty)
                    ...user.linkList
                        .map(
                          (e) => user.linkList.indexOf(e) == 0
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(top: 24, bottom: 6),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        e.icon,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(e.url),
                                      )
                                    ],
                                  ))
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Row(
                                    //  mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        e.icon,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(e.url),
                                      )
                                    ],
                                  ),
                                ),
                        )
                        .toList(),
                  // if (user.linkList.isNotEmpty)
                  //   Padding(
                  //     padding: const EdgeInsets.only(bottom: 8, left: 32),
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, '/resumeMaker');
                  //       },
                  //       style: ButtonStyle(
                  //           padding: MaterialStateProperty.all(
                  //               const EdgeInsets.symmetric(
                  //                   vertical: 10, horizontal: 32)),
                  //           backgroundColor:
                  //               MaterialStateProperty.all(Colors.pinkAccent),
                  //           shape: MaterialStateProperty.all(
                  //               const RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.all(
                  //                       Radius.circular(16))))),
                  //       child: const Text(
                  //         'Create Resume',
                  //         style: TextStyle(fontSize: 16),
                  //       ),
                  //     ),
                  //   )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: floatingButtonFlag
            ? FloatingActionButton.extended(
                backgroundColor: Colors.pinkAccent,
                onPressed: () {
                  if (user.linkList.isNotEmpty &&
                      user.languageList.isNotEmpty &&
                      user.projectsList.isNotEmpty &&
                      user.skillList.isNotEmpty &&
                      user.educationList.isNotEmpty &&
                      user.experienceList.isNotEmpty &&
                      user.image != null &&
                      user.info.designation.isNotEmpty &&
                      user.info.name.isNotEmpty &&
                      user.info.location.isNotEmpty &&
                      user.info.email.isNotEmpty &&
                      user.info.contact.isNotEmpty) {
                    Navigator.pushNamed(context, '/resumeMaker');
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Incomplete Information'),
                            content:
                                const Text('Please fill all information first'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'))
                            ],
                          );
                        });
                  }
                },
                label: const Text(
                  'Preview Resume',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : null,
      );
    });
  }
}
