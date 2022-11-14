import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/core/utils/status.dart';
import 'package:it_expert/ui/assessments/assessment_detail/assessment_detail_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../style.dart';
import '../assessment_application/assessment_application_page.dart';
import 'dart:io' show Platform;

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
    controller.fetchAssessmentAvailableInfo(widget.assessmentDto.id);
    print("thumbnailUrl: ${controller.assessmentDto.thumbnailUrl}");
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
              if (controller.assessmentAvailableDto.isAvailable == true)
                Text(
                  "Intentos disponibles: ${controller.assessmentAvailableDto.attemptsLeft}",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              Container(
                width: context.width,
                constraints: const BoxConstraints(maxHeight: 400),
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Image.network(controller.assessmentDto.thumbnailUrl,
                    fit: BoxFit.cover),
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
              SizedBox(height: 28),
              if (controller.assessmentAvailableDto.isAvailable == true)
                StartAssessmentBtn(assessmentId: controller.assessmentDto.id),
              if (controller.assessmentAvailableDto.isPremium == true &&
                  controller.assessmentAvailableDto.isAvailable == false)
                UnlockPremiumExamBtn(context: context),
              if (controller.assessmentAvailableDto.isAvailable == false &&
                  controller.assessmentAvailableDto.isPremium == false)
                NoTriesLeftBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

void _showPremiumAssessmentDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text("Premium"),
                content: const Text(
                    "Al adquirir alguno de nuestros cursos desbloqueas los examenes asociados"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Cancelar',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () => launchUrlString(
                        'https://mrpcapacitacion.mx/product-category/cursos/'),
                    child: Text('Explorar cursos',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Theme.of(context).primaryColor)),
                  ),
                ],
              )
            : const AlertDialog(
                title: Text("Success"),
                // TODO: Hacer las madres también para android
                content: Text("Saved successfully"),
              );
      });
}

class NoTriesLeftBtn extends StatefulWidget {
  const NoTriesLeftBtn({Key? key}) : super(key: key);

  @override
  State<NoTriesLeftBtn> createState() => _NoTriesLeftBtnState();
}

class _NoTriesLeftBtnState extends State<NoTriesLeftBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          gradient: const LinearGradient(colors: [
            Colors.black38,
            Colors.black38,
          ])),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text('Opps, se te acabaron los intentos'),
          ),
        ],
      ),
    );
  }
}

class StartAssessmentBtn extends StatefulWidget {
  const StartAssessmentBtn({Key? key, required this.assessmentId})
      : super(key: key);
  final String assessmentId;

  @override
  State<StartAssessmentBtn> createState() => _StartAssessmentBtnState();
}

class _StartAssessmentBtnState extends State<StartAssessmentBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorDark,
          ])),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              Get.to(() =>
                  AssessmentApplicationPage(assessmentId: widget.assessmentId));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            child: const Text('Iniciar Examen'),
          ),
        ],
      ),
    );
  }
}

class UnlockPremiumExamBtn extends StatefulWidget {
  const UnlockPremiumExamBtn({Key? key, required this.context})
      : super(key: key);
  final BuildContext context;

  @override
  State<UnlockPremiumExamBtn> createState() => _UnlockPremiumExamBtnState();
}

class _UnlockPremiumExamBtnState extends State<UnlockPremiumExamBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          gradient: const LinearGradient(colors: [
            Colors.amberAccent,
            Colors.amber,
          ])),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showPremiumAssessmentDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text('Desbloquea examen Premium'),
          ),
        ],
      ),
    );
  }
}
