import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/user/password_reset/reset_instructions/instructions_controller.dart';
import 'package:it_expert/ui/user/password_reset/reset_form/reset_form_page.dart';
import 'package:it_expert/ui/style.dart';


class InstructionsPage extends StatelessWidget {
  const InstructionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InstructionsController controller = Get.put(InstructionsController());
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(8.0),
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
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Escribe tu email..."),
                  style: Theme.of(context).textTheme.bodyMedium,
                  )
                ),
                Padding(padding: EdgeInsets.only(bottom: 8.0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ResetFormPage());
                      },
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(AppColor.primary)),
                      child: Text("Envíame un correo", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
                    )
                )
              ],
            ),
          ),
        ),
      );
  }
}