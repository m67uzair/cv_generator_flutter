import 'package:cv_generator/components/custom_text_form_field.dart';
import 'package:cv_generator/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLanguagesScreen extends StatefulWidget {
  const AddLanguagesScreen({super.key});

  @override
  State<AddLanguagesScreen> createState() => _AddLanguagesScreenState();
}

class _AddLanguagesScreenState extends State<AddLanguagesScreen> {
  TextEditingController languageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(title: const Text("Add Language")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Language",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    // maxLines: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input language';
                      }
                      return null;
                    },
                    controller: languageController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    )),
                  ),
                  const SizedBox(height: 64),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        user.addLanguages(
                            language: languageController.text.toUpperCase());
                        languageController.clear();
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
                      'Add Language',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (user.languageList.isNotEmpty)
                    ...user.languageList
                        .map(
                          (e) => user.languageList.indexOf(e) == 0
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 4),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          color: Colors.amberAccent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )),
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 4),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  width: MediaQuery.of(context).size.width / 2,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Colors.amberAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                        )
                        .toList(),
                  if (user.languageList.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 0, top: 32),
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, '/linkScreen');
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 32)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.pinkAccent),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16))))),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
