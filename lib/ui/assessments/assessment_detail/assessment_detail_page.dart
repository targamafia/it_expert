import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/core/utils/status.dart';
import 'package:it_expert/ui/assessments/assessment_detail/assessment_detail_controller.dart';
import '../../style.dart';
import '../assessment_application/assessment_application_page.dart';

class AssessmentDetailPage extends StatefulWidget {
  const AssessmentDetailPage({Key? key, required this.assessmentDto})
      : super(key: key);
  final AssessmentDto assessmentDto;

  @override
  State<AssessmentDetailPage> createState() => _AssessmentDetailPageState();
}

class _AssessmentDetailPageState extends State<AssessmentDetailPage> {
  @override
  Widget build(BuildContext context) {
    AssessmentDetailController controller =
        Get.put(AssessmentDetailController());

    controller.assessmentDto = widget.assessmentDto;
    controller.fetchAssessmentAttemps(widget.assessmentDto.id);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Obx(
        () => Stack(
          children: [
            if (controller.status.value == Status.LOADING)
              const Center(
                child: Text("Loading..."),
              ),
            if (controller.status.value == Status.SUCCESS)
              const AssessmentDetailPageSuccess(),
          ],
        ),
      ),
    );
  }
}

class AssessmentDetailPageSuccess extends StatelessWidget {
  const AssessmentDetailPageSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    AssessmentDetailController controller = Get.find();
    print("Attemps: ${controller.gradeReportDto.remainingAttemps}");
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.assessmentDto.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.75)),
              ),
              Wrap(
                children: controller.assessmentDto.categories
                    .map<Card>(
                      (it) => Card(
                        color: AppColor.randomLabelColor(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: Text(
                            "#$it",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Container(
                padding: const EdgeInsets.only(top: 32.0, bottom: 20.0),
                child: Image.network(
                    "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80"),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Descripción',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.75)),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                controller.assessmentDto.description,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.black.withOpacity(.65), fontSize: 16.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
                    onPressed: () async {
                      // TODO: Verificar si hay todavía intentos disponibles
                      Get.offAll(() => AssessmentApplicationPage(
                          assessmentId: controller.assessmentDto.id));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: const Text('Iniciar Examen'),
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
