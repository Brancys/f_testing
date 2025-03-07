import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../content/home.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.email, required this.password})
      : super(key: key);

  final String email;
  final String password;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login with email",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldLoginEmail'),
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email";
                    } else if (!value.contains('@')) {
                      return "Enter valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldLoginPassword'),
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    } else if (value.length < 6) {
                      return "Password should have at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                    key: const Key('ButtonLoginSubmit'),
                    onPressed: () {
                      // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = _formKey.currentState;
                      form!.save();
                      if (form.validate()) {
                        if (widget.email == _emailController.text &&
                            widget.password == _passwordController.text) {
                          Get.offAll(HomePage(
                            key: const Key('HomePage'),
                            loggedEmail: _emailController.text,
                            loggedPassword: _passwordController.text,
                          ));
                        } else {
                          const snackBar = SnackBar(
                            content: Text('User or passwor nok'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Validation nok'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text("Submit")),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    key: const Key('ButtonLoginCreateAccount'),
                    onPressed: () => Get.to(const SignUpPage(
                          key: Key('SignUpPage'),
                        )),
                    child: const Text('Create account'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
