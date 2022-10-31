import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/assessments/assessment_result/assessment_result_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../home/home_page.dart';

class AssessmentResultPage extends StatefulWidget {
  const AssessmentResultPage({Key? key, required this.grade}) : super(key: key);
  final double grade;
  @override
  State<AssessmentResultPage> createState() => _AssessmentResultPageState();
}

class _AssessmentResultPageState extends State<AssessmentResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Column(
              children: [
                const Text(
                  "Porcentaje de respuestas correctas:",
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 20.0,
                    percent: widget.grade,
                    center: Text(
                      "${(widget.grade * 100).round()}%",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    progressColor: Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        gradient: LinearGradient(colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColorDark
                        ])),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => const HomePage());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text('Volver a Inicio'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
