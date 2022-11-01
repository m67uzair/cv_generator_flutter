import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cv_generator/model/user_data.dart';
import 'package:cv_generator/components/card_grid.dart';
import 'package:cv_generator/components/costume_alert_dialogue.dart';

class FillDetailsScreen extends StatefulWidget {
  FillDetailsScreen({super.key});

  UserData user = UserData();

  @override
  State<FillDetailsScreen> createState() => _FillDetailsScreenState();
}

class _FillDetailsScreenState extends State<FillDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController instituteNameController = TextEditingController();
    TextEditingController courseController = TextEditingController();
    TextEditingController stdFromController = TextEditingController();
    TextEditingController stdToController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fill The Details"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Signed-in as : "),
            Text(FirebaseAuth.instance.currentUser!.email.toString()),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: const Text("Sign out"))
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Consumer<UserData>(
                builder: (context, user, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Fill The Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'san-serif'),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Personal Info",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 4,
                      endIndent: 4,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10),
                    //   child: CircleAvatar(
                    //       backgroundColor: Colors.grey,
                    //       radius: 35,
                    //       child: SizedBox(
                    //           width: 120,
                    //           height: 120,
                    //           child: ClipOval(
                    //             child: Image.asset(
                    //               "assets/images/profilePicture.png",
                    //             ),
                    //           ))),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 5, bottom: 10),
                    //   child: TextFormField(
                    //     decoration: const InputDecoration(
                    //       contentPadding:
                    //           EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    //       label: Text("Name"),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(10.0),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.phone,
                    //     decoration: const InputDecoration(
                    //       contentPadding:
                    //           EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    //       label: Text("Contact"),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(10.0),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: const InputDecoration(
                    //       contentPadding:
                    //           EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    //       label: Text("Email"),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(10.0),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 10),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.streetAddress,
                    //     maxLines: 4,
                    //     decoration: const InputDecoration(
                    //       contentPadding:
                    //           EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    //       label: Text("Address"),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(10.0),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "What are you looking for?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 4,
                      endIndent: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                          label: Text("Job Title"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 60,
                    // ),
                    // const Text(
                    //   "Experience",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 18,
                    //   ),
                    // ),
                    // const Divider(
                    //   thickness: 2,
                    //   indent: 4,
                    //   endIndent: 4,
                    // ),
                    // CardGrid(
                    //   list: user.experienceList,
                    //   title: 'companyName',
                    //   subtitle: 'occupation',
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10.0),
                    //   child: Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: CostumeAlertDialogue(
                    //       context: context,
                    //       buttonTitle: "Add Experience",
                    //       instituteType: "Company Name",
                    //       occupationType: "Job Title",
                    //       instituteTypeController: companyNameController,
                    //       occupationTypeController: occupationController,
                    //       fromController: expFromController,
                    //       toController: expToController,
                    //       user: user,
                    //       onPressed: () {
                    //         user.addExperience(
                    //             companyName: companyNameController.text,
                    //             occupation: occupationController.text,
                    //             fromDate: expFromController.text,
                    //             toDate: expToController.text);
                    //       },
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Education",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 4,
                      endIndent: 4,
                    ),
                    CardGrid(
                        list: user.educationList,
                        title: 'instituteName',
                        subtitle: 'course',
                        user: user),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CostumeAlertDialogue(
                          context: context,
                          buttonTitle: "Add Education",
                          instituteType: "Institute Name",
                          occupationType: "Degree/Course Title",
                          instituteTypeController: instituteNameController,
                          occupationTypeController: courseController,
                          fromController: stdFromController,
                          toController: stdToController,
                          onPressed: () {
                            user.addEducation(
                              instituteName: instituteNameController.text,
                              course: courseController.text,
                              fromDate: stdFromController.text,
                              toDate: stdToController.text,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
