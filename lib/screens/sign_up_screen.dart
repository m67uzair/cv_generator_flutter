import 'package:cv_generator/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onclickedLogin;

  const SignUp({super.key, required this.onclickedLogin});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/handshake.png',
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.8,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign Up',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CustomTextFormField(
                        controller: nameController,
                        hintText: 'Full Name',
                        icon: const Icon(Icons.person),
                        validator: RequiredValidator(
                            errorText: 'Name Can\'t Be Empty'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: CustomTextFormField(
                          hintText: "Mobile",
                          icon: const Icon(Icons.smartphone),
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Phone Number Cant be Empty"),
                            MinLengthValidator(11,
                                errorText:
                                    "Phone number must be atleast 11 digits"),
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: CustomTextFormField(
                        hintText: "Email",
                        icon: const Icon(Icons.alternate_email),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Email cant be empty'),
                          EmailValidator(errorText: 'Enter valid email address')
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: CustomTextFormField(
                        hintText: "Password",
                        icon: const Icon(Icons.key),
                        controller: passwordController,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Password cant be empty'),
                          MinLengthValidator(6,
                              errorText:
                                  'Password must be between 6-15 characters'),
                          MaxLengthValidator(15,
                              errorText:
                                  'Password must be between 6-15 characters')
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: "By signing up, you're agreeing to our",
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextSpan(
                                text: "Terms & Conditions ",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('terms and conditions');
                                  }),
                            const TextSpan(
                                text: "and ",
                                style: TextStyle(color: Colors.black54)),
                            TextSpan(
                                text: "Privacy Policy",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("pado man");
                                  })
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        formKey.currentState?.validate();

                        showDialog(
                          context: context,
                          builder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          barrierDismissible: false,
                        );

                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        } on FirebaseAuthException catch (e) {
                          print(e);
                        }
                        navigatorKey.currentState!
                            .popUntil((route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                      child: const Text("Continue"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            const TextSpan(
                                text: "Joined us before? ",
                                style: TextStyle(color: Colors.black54)),
                            TextSpan(
                              text: "Login",
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onclickedLogin,
                            )
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final Icon icon;
  bool obscureText = true;
  TextInputType keyboardType;
  final String? Function(String? value) validator;

  final TextEditingController controller;
  IconData suffixIcon = Icons.visibility;
  CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.controller,
      this.keyboardType = TextInputType.text,
      required this.validator})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.hintText.toLowerCase() == "password"
          ? widget.obscureText
          : false,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black38,
        ),
        icon: widget.icon,
        suffixIcon: widget.hintText.toLowerCase() == "password"
            ? InkWell(
                child: Icon(widget.suffixIcon),
                onTap: () {
                  setState(() {
                    widget.obscureText =
                        widget.obscureText == true ? false : true;
                    widget.suffixIcon = widget.suffixIcon == Icons.visibility
                        ? Icons.visibility_off
                        : Icons.visibility;
                  });
                },
              )
            : null,
      ),
    );
  }
}
