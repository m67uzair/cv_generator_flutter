import 'dart:io';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:cv_generator/components/custom_text_form_field.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final ImagePicker picker = ImagePicker();
  XFile? image;
  var _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 60,
                        backgroundImage: _image == null
                            ? Image.asset(
                                "assets/images/profilePicture.png",
                              ).image
                            : Image.file(
                                _image,
                                fit: BoxFit.cover,
                              ).image,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          iconSize: 28,
                          onPressed: () async {
                            image = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (image != null) {
                              setState(() {
                                _image = File(image!.path);
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.blueAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, bottom: 20),
                  child: CustomTextFormField(
                    controller: nameController,
                    label: "Full Name",
                    validator:
                        RequiredValidator(errorText: "Name Can't be empty "),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomTextFormField(
                    controller: contactController,
                    label: "Contact",
                    keyboardType: TextInputType.phone,
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: "Phone number cant be empty"),
                      MinLengthValidator(11,
                          errorText:
                              "Phone number must be atleast 11 digits long")
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomTextFormField(
                    controller: emailController,
                    label: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Email cant be empty"),
                      EmailValidator(
                          errorText: "Please enter a valid email address")
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomTextFormField(
                      controller: locationController,
                      label: "Location",
                      validator: RequiredValidator(
                          errorText: "Location Can't be empty")),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomTextFormField(
                    controller: dateOfBirthController,
                    label: "Date of Birth",
                    readOnly: true,
                    onTap: () async {
                      DateTime? dob = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                      );
                      if (dob != null) {
                        debugPrint(dob.toString());
                        String formatedToDate =
                            DateFormat('MM-dd-yyyy').format(dob);
                        setState(() {
                          dateOfBirthController.text = formatedToDate;
                        });
                      }
                    },
                    suffixIcon: const Icon(Icons.calendar_month),
                    validator: RequiredValidator(
                        errorText: "Please enter your date of birth"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.validate();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0))),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(fontSize: 25),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
