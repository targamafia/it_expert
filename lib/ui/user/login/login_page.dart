import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/home_page.dart';
import 'package:it_expert/ui/style.dart';
import 'package:it_expert/ui/user/login/login_controller.dart';

import 'dart:io' show Platform;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/logo.png"),
                height: 42,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Iniciar sesion",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, bottom: 20),
                width: 200,
                child: Text(
                  "Experiencia en cursos educativos de alta calidad",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (text) {
                        controller.email(text);
                      },
                      validator: (text) {
                        if (text == null ||
                            text.isEmpty ||
                            !GetUtils.isEmail(text)) {
                          return 'Ingresa un email válido';
                        }
                        return null;
                      },
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'email',
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      onChanged: (text) {
                        controller.password(text);
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Ingresa tu contraseña';
                        }
                        return null;
                      },
                      autocorrect: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "¿Olvidaste tu contraseña?",
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          gradient: const LinearGradient(colors: [
                            AppColor.bluetiful,
                            AppColor.midnightBlue
                          ])),
                      child: ElevatedButton(
                        onPressed: ([bool mounted = true]) async {
                          if (_formKey.currentState!.validate()) {
                            await controller.login();
                            if (controller.loginSuccess) {
                              Get.offAll(
                                () => HomePage(),
                                transition: Transition.circularReveal,
                                duration: const Duration(milliseconds: 500),
                              );
                            } else {
                              // Removes warning for stateless components, check: https://stackoverflow.com/questions/68871880/do-not-use-buildcontexts-across-async-gaps
                              if (!mounted) return;
                              _showLoginErrorDialog(
                                  context, controller.errorMessage);
                            }
                          }
                        },
                        child: const Text("Iniciar sesión"),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextButton(
                    onPressed: () {}, child: const Text("O crea una cuenta")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoginErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: const Text("Error al iniciar sesion"),
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
