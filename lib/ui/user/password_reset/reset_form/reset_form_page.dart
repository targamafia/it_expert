import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/user/password_reset/reset_form/reset_form_controller.dart';
import 'package:it_expert/ui/style.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';


class ResetFormPage extends StatelessWidget {
  const ResetFormPage({Key? key}) : super(key: key);

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
              Padding(padding: EdgeInsets.only(top: 64.0, bottom: 16.0),
                child: Text('Nueva contraseña',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start),
              ),
              Padding(padding: EdgeInsets.only(bottom: 64.0),
                child: Text('Introduce el pin que recibiste en tu correo electrónico y posteriormente escribe tu nueva contraseña',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.0),
                    textAlign: TextAlign.left),
              ),
              Padding(padding: EdgeInsets.only(bottom: 64.0),
                child: PinCodeFields(
                  length: 6,
                  fieldBorderStyle: FieldBorderStyle.Square,
                  responsive: false,
                  fieldHeight:38.0,
                  fieldWidth: 38.0,
                  borderWidth:1.0,
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
                    print(output);
                  },
                ), ),
              Padding(padding: EdgeInsets.only(bottom: 16.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Escribe tu nueva contraseña..."),
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
              ),
              Padding(padding: EdgeInsets.only(bottom: 16.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Confirma tu contraseña..."),
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
              ),
              Padding(padding: EdgeInsets.only(bottom: 8.0),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => ResetFormPage());
                    },
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(AppColor.primary)),
                    child: Text("Actualizar mi contraseña", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}