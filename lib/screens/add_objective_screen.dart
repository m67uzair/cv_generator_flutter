import 'package:cv_generator/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddObjectiveScreen extends StatefulWidget {
  const AddObjectiveScreen({super.key});

  @override
  State<AddObjectiveScreen> createState() => _AddObjectiveScreenState();
}

class _AddObjectiveScreenState extends State<AddObjectiveScreen> {
  TextEditingController objectiveController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Objective")),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          CustomTextFormField(
              controller: objectiveController,
              label: "Objective",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Objective can't be empty";
                }
                return null;
              })
        ],
      ),
    );
  }
}
