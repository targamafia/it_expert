import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/home_page.dart';
import 'package:it_expert/ui/user/sign_up/sign_up_controller.dart';

import 'dart:io' show Platform;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          alignment: Alignment.topCenter,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Crea tu cuenta",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (text) {
                    controller.name(text);
                  },
                  autocorrect: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre(s)',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (text) {
                    controller.lastName(text);
                  },
                  autocorrect: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Apellido(s)',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (text) {
                    controller.email(text);
                  },
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (text) {
                    controller.password(text);
                  },
                  autocorrect: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (text) {
                    controller.confirmedPassword(text);
                  },
                  autocorrect: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirma la contraseña',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: ElevatedButton(
                      onPressed: ([bool mounted = true]) async {
                        if (_formKey.currentState!.validate()) {
                          await controller.signUp();
                          print(
                              "Is signup sucess: ${controller.signUpSuccess}");
                          if (controller.signUpSuccess) {
                            Get.offAll(
                              () => const HomePage(),
                              transition: Transition.circularReveal,
                              duration: const Duration(milliseconds: 500),
                            );
                          } else {
                            // Removes warning for stateless components, check: https://stackoverflow.com/questions/68871880/do-not-use-buildcontexts-across-async-gaps
                            if (!mounted) return;
                            _showSignUpErrorDialog(
                                context, controller.errorMessage);
                          }
                        }
                      },
                      child: const Text("Crear cuenta"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _showSignUpErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: const Text("Error al crear cuenta"),
                  content: Text(message),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                )
              : const AlertDialog(
                  title: Text("Success"),
                  content: Text("Saved successfully"),
                );
        });
  }
}
