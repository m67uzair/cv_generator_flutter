import 'package:cv_generator/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../components/costume_alert_dialogue.dart';

import 'package:cv_generator/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/card_grid.dart';
import '../components/costume_alert_dialogue.dart';

class AddProjectsScreen extends StatefulWidget {
  const AddProjectsScreen({super.key});

  @override
  State<AddProjectsScreen> createState() => _AddProjectsScreenState();
}

class _AddProjectsScreenState extends State<AddProjectsScreen> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController expFromController = TextEditingController();
  TextEditingController expToController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (context, user, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Add Projects"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: const Text(
                "Add Your Projects",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 4,
              endIndent: 4,
            ),
            Expanded(
              child: CardGrid(
                list: user.projectsList,
                title: 'projectName',
                subtitle: 'remarks',
                user: user,
              ),
            ),
            if (user.projectsList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/languageScreen');
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 32)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pinkAccent),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))))),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CostumeAlertDialogue(
                    context: context,
                    buttonTitle: "Project",
                    instituteType: "Project Name",
                    occupationType: "remarks",
                    instituteTypeController: projectNameController,
                    occupationTypeController: remarksController,
                    fromController: expFromController,
                    toController: expToController,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        user.addProjects(
                            name: projectNameController.text.toUpperCase(),
                            remarks: remarksController.text,
                            fromDate: expFromController.text,
                            toDate: expToController.text);
                      }
                    },
                    formKey: _formKey,
                  ),
                ),
              ),
            );
          },
          label: const Text("Projects"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// class AddObjectiveScreen extends StatefulWidget {
//   const AddObjectiveScreen({super.key});
//
//   @override
//   State<AddObjectiveScreen> createState() => _AddObjectiveScreenState();
// }
//
// class _AddObjectiveScreenState extends State<AddObjectiveScreen> {
//   TextEditingController objectiveController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   TextEditingController projectNameController = TextEditingController();
//   TextEditingController remarksController = TextEditingController();
//   TextEditingController expFromController = TextEditingController();
//   TextEditingController expToController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Add Projects")),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 50),
//                 const Text(
//                   "Projects",
//                   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                 ),
//                 // const SizedBox(height: 50),
//                 // TextFormField(
//                 //   maxLines: 10,
//                 //   decoration: const InputDecoration(
//                 //       border: OutlineInputBorder(
//                 //     borderRadius: BorderRadius.all(
//                 //       Radius.circular(15.0),
//                 //     ),
//                 //   )),
//                 // ),
//                 // const SizedBox(height: 80),
//                 // ElevatedButton(
//                 //   onPressed: () {
//                 //     formKey.currentState!.validate();
//                 //     objectiveController.clear();
//                 //     Navigator.pushNamed(context, '/personalInfoScreen');
//                 //   },
//                 //   style: ElevatedButton.styleFrom(
//                 //       maximumSize: Size(MediaQuery.of(context).size.width, 80),
//                 //       minimumSize: Size(MediaQuery.of(context).size.width, 40),
//                 //       padding: const EdgeInsets.symmetric(vertical: 10)),
//                 //   child: const Text(
//                 //     'Continue',
//                 //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 //   ),
//                 // )
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: CostumeAlertDialogue(
//                   context: context,
//                   buttonTitle: "Project",
//                   instituteType: "Name",
//                   occupationType: "Remarks",
//                   instituteTypeController: projectNameController,
//                   occupationTypeController: remarksController,
//                   fromController: expFromController,
//                   toController: expToController,
//                   onPressed: () {
//                     user.addExperience(
//                         companyName: projectNameController.text,
//                         occupation: remarksController.text,
//                         fromDate: expFromController.text,
//                         toDate: expToController.text);
//                   },
//                 ),
//               ),
//             ),
//           );
//         },
//         label: const Text("Projects"),
//         icon: const Icon(Icons.add),
//       ),
//     );
//   }
// }
