import 'package:cv_generator/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddObjectiveScreen extends StatefulWidget {
  const AddObjectiveScreen({super.key});

  @override
  State<AddObjectiveScreen> createState() => _AddObjectiveScreenState();
}

class _AddObjectiveScreenState extends State<AddObjectiveScreen> {
  TextEditingController objectiveController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Objective")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Objective",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  maxLines: 10,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  )),
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.validate();
                    objectiveController.clear();
                    Navigator.pushNamed(context, '/personalInfoScreen');
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(MediaQuery.of(context).size.width, 80),
                      minimumSize: Size(MediaQuery.of(context).size.width, 40),
                      padding: const EdgeInsets.symmetric(vertical: 10)),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
