import 'package:cv_generator/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/card_grid.dart';
import '../components/costume_alert_dialogue.dart';

class AddExperienceScreen extends StatefulWidget {
  const AddExperienceScreen({super.key});

  @override
  State<AddExperienceScreen> createState() => _AddExperienceScreenState();
}

class _AddExperienceScreenState extends State<AddExperienceScreen> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController expFromController = TextEditingController();
  TextEditingController expToController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (context, user, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Add Experience"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Center(
              child: Text(
                "Add Your Experiences",
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
                list: user.experienceList,
                title: 'companyName',
                subtitle: 'occupation',
                user: user,
              ),
            ),
            if (user.educationList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/skillsScreen');
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
                    buttonTitle: "Experience",
                    instituteType: "Company Name",
                    occupationType: "Job Title",
                    instituteTypeController: companyNameController,
                    occupationTypeController: occupationController,
                    fromController: expFromController,
                    toController: expToController,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        user.addExperience(
                            companyName:
                                companyNameController.text.toUpperCase(),
                            occupation: occupationController.text.toUpperCase(),
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
          label: const Text("Experience"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
