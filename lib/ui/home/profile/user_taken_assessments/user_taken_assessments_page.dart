import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/history/history_controller.dart';

import '../../history/history_page.dart';



class TakenAssessments extends StatelessWidget {
  const TakenAssessments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HistoryController controller = Get.put(HistoryController());
    controller.fetchHistory();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
        child: SingleChildScrollView(
        child: HistoryPage(),
        ),
        ),
    );
  }

}