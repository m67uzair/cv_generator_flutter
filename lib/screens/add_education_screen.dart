import 'package:cv_generator/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/card_grid.dart';
import '../components/costume_alert_dialogue.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({super.key});

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  TextEditingController instituteNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController stdFromController = TextEditingController();
  TextEditingController stdToController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (context, user, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Add Education"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Center(
              child: Text(
                "Add Your Education",
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
            if (user.educationList.isNotEmpty)
              Expanded(
                child: CardGrid(
                  list: user.educationList,
                  title: 'instituteName',
                  subtitle: 'course',
                  user: user,
                ),
              ),
            if (user.educationList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/experienceScreen');
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
                    buttonTitle: "Education",
                    instituteType: "Institute Name",
                    occupationType: "Course/Degree Title",
                    instituteTypeController: instituteNameController,
                    occupationTypeController: courseController,
                    fromController: stdFromController,
                    toController: stdToController,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        user.addEducation(
                            instituteName:
                                instituteNameController.text.toUpperCase(),
                            course: courseController.text.toUpperCase(),
                            fromDate: stdFromController.text,
                            toDate: stdToController.text);
                      }
                    },
                    formKey: _formKey,
                  ),
                ),
              ),
            );
          },
          label: const Text("Education"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
