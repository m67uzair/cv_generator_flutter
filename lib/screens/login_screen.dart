import 'package:cv_generator/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Login extends StatefulWidget {
  final VoidCallback onClickedRegister;

  const Login({super.key, required this.onClickedRegister});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/login.png',
                    fit: BoxFit.contain,
                    width: size.width,
                    height: size.height / 3,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 22.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Login',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            controller: emailController,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.alternate_email),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Input Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            controller: passwordController,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            obscureText: true,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              icon: Icon(Icons.lock_outline_rounded),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Input Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.indigo.shade900),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );

                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              } on FirebaseAuthException catch (e) {
                                print(e);
                                print(emailController.text);
                                print(passwordController.text);
                              }

                              navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                          child: const Text("Login"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                  text: "New here? ",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                TextSpan(
                                  text: "Register!",
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = widget.onClickedRegister,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
