import 'package:cv_generator/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AddSkillsScreen extends StatefulWidget {
  const AddSkillsScreen({super.key});

  @override
  State<AddSkillsScreen> createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends State<AddSkillsScreen> {
  TextEditingController skillsController = TextEditingController();
  final List skillsList = ['C++', 'JAVA', 'HTML'];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                        setState(() {
                          formKey.currentState!.validate()
                              ? skillsList.add(skillsController.text.trim())
                              : null;
                          skillsController.clear();
                        });
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
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: skillsList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.psychology),
                  title: Text(skillsList[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
