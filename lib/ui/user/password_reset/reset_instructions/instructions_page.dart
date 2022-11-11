import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/user/password_reset/reset_instructions/instructions_controller.dart';
import 'package:it_expert/ui/user/password_reset/reset_form/reset_form_page.dart';
import 'package:it_expert/ui/style.dart';

class InstructionsPage extends StatefulWidget {
  const InstructionsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InstructionsPage();
}

class _InstructionsPage extends State<InstructionsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final InstructionsController controller = Get.put(InstructionsController());
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
                Padding(padding: EdgeInsets.only(top: 64.0, bottom: 16.0),
                child: Text('Reestablecer contraseña',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.start),
                ),
                Padding(padding: EdgeInsets.only(bottom: 32.0),
                  child: Text('Introduce el correo electrónico asociado a tu cuenta MRP y te enviaremos un correo con instrucciones para reestablecer tu contraseña',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),
                Padding(padding: EdgeInsets.only(bottom: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      children: [
                        TextFormField( obscureText: false,
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Escribe tu email...",
                            prefixIcon: Icon(Icons.mail)),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                        Padding(padding: EdgeInsets.only(top: 16.0),
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
                            onPressed: ([bool mounted = true]) {
                              if (_formKey.currentState!.validate()) {
                                //await controller.login();
                                // if (controller.loginSuccess) {
                                Get.to(() => ResetFormPage());
                                //     transition: Transition.circularReveal,
                                //     duration:
                                //     const Duration(milliseconds: 500),
                                //   );
                              }
                            },
                            child: Text("Envíame un correo", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
                          ),
                        ),
                        )
                    ]
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}