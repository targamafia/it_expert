import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/user/login/login_page.dart';
import 'package:it_expert/ui/user/password_reset/reset_form/reset_form_controller.dart';
import 'package:it_expert/ui/style.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:it_expert/ui/user/password_reset/reset_instructions/instructions_controller.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io' show Platform;

class ResetFormPage extends StatefulWidget {
  const ResetFormPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResetFormPage();
}

class _ResetFormPage extends State<ResetFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = Get.find<InstructionsController>().email;

  @override
  Widget build(BuildContext context) {
    final ResetFormController controller = Get.put(ResetFormController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 64.0, bottom: 16.0),
                child: Text('Nueva contraseña',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 64.0),
                child: Text(
                    'Introduce el pin que recibiste en tu correo electrónico y posteriormente escribe tu nueva contraseña',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 16.0),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 64.0),
                child: PinCodeFields(
                  length: 6,
                  fieldBorderStyle: FieldBorderStyle.Square,
                  responsive: false,
                  fieldHeight: 38.0,
                  fieldWidth: 38.0,
                  borderWidth: 1.0,
                  activeBorderColor: AppColor.materialBlue.shade200,
                  activeBackgroundColor: AppColor.materialBlue.shade50,
                  borderRadius: BorderRadius.circular(10.0),
                  keyboardType: TextInputType.number,
                  autoHideKeyboard: true,
                  fieldBackgroundColor: Colors.black12,
                  borderColor: Colors.black38,
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onComplete: (output) {
                    // Your logic with pin code
                    controller.pin(output);
                    print(output);
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: true,
                          onChanged: (text) {
                            controller.password(text);
                          },
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Ingresa la contraseña';
                            }
                            return null;
                          },
                          autocorrect: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Escribe tu nueva contraseña...",
                              prefixIcon: Icon(Icons.lock)),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: TextFormField(
                              obscureText: true,
                              onChanged: (text) {
                                controller.password2(text);
                              },
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Ingresa la contraseña';
                                }
                                return null;
                              },
                              autocorrect: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Confirma tu contraseña...",
                                  prefixIcon: Icon(Icons.lock)),
                              style: Theme.of(context).textTheme.bodyMedium,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: Container(
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
                                  await controller.changePassword(_email.value);
                                  if (controller.isSuccess) {
                                    Get.offAll(
                                      () => LoginPage(),
                                      transition: Transition.circularReveal,
                                      duration:
                                          const Duration(milliseconds: 500),
                                    );
                                  } else {
                                      if (!mounted) return;
                                      _showResetDialog(
                                      context, controller.errorMessage.value);
                                  }
                                }
                              },
                              child: Text("Envíame un correo",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: const Text("Error al recuperar contraseña"),
                  content: Text(message),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                )
              : AlertDialog(
                  title: Text("Error"),
                  content: Text(message),
                );
        });
  }
}
