import 'package:cv_generator/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_data.dart';

class AddSkillsScreen extends StatefulWidget {
  const AddSkillsScreen({super.key});

  @override
  State<AddSkillsScreen> createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends State<AddSkillsScreen> {
  TextEditingController skillsController = TextEditingController();
  // final List skillsList = ['C++', 'JAVA', 'HTML'];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(title: const Text("Add Skills")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text("Add an skill",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                        hintText: "for example: HTML",
                        icon: const Icon(Icons.psychology),
                        controller: skillsController,
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return "Field can't be empty";
                          }
                          return null;
                        }),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        // ignore: prefer_const_constructors
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll<
                                    EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10))),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            user.addSkill(
                                skill: skillsController.text.toUpperCase());
                            skillsController.clear();
                            //  print(user.skillList.length);
                          }
                        },
                        child: const Text(
                          "ADD",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              if (user.skillList.isNotEmpty)
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: ListView.builder(
                    itemCount: user.skillList.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.psychology),
                      title: Text(user.skillList[index]),
                    ),
                  ),
                ),
              if (user.skillList.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/projectScreen');
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
        ),
      );
    });
  }
}
