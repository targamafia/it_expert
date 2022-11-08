import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/profile/user_premium_exams/user_premium_exams_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:it_expert/core/assessment/domain/dto/assessment_dto.dart';
import 'package:it_expert/ui/assessments/assessment_detail/assessment_detail_page.dart';
import 'package:it_expert/ui/home/widget/best_assessment_card_widget.dart';
import 'package:it_expert/ui/home/widget/featured_assessment_card_widget.dart';
import 'package:it_expert/ui/style.dart';

class UserPremiumExams extends StatefulWidget {
  const UserPremiumExams({Key? key}) : super(key: key);

  @override
  State<UserPremiumExams> createState() => _UserPremiumExamsState();
}

  /*@override
  Widget build(BuildContext context) {
    final UserPremiumExamsController controller = Get.put(UserPremiumExamsController());

    var padding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height;
    double newheight = height - padding.top - padding.bottom;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, newheight / 8, 0, 0),
            child: SelectionArea(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: SelectionArea(
                    child: Text("Tus exámenes premium")),
              ),
            )), // Title
      ]),
    );
  }*/


class _UserPremiumExamsState extends State<UserPremiumExams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  child: Text(
                    "Tus exámenes Premium",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.75)),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                Center(
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder:
                        (BuildContext context, int itemIndex, int pageViewIndex) {
                      return BestAssessmentCardWidget(
                        assessmentDto: AssessmentDto(
                          questions: [],
                          title: "Lo más cool",
                          description: "Mucha descripciòn",
                          categories: ["IoT", "CISCO", "CCNA II"],
                          id: '',
                          isPremium: true,
                          isPrivate: true,
                          rating: 5,
                          thumbnailUrl:
                          'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
                        ),
                        onPressed: () {
                          Get.to(
                                () => AssessmentDetailPage(
                              assessmentDto: AssessmentDto(
                                questions: [],
                                categories: [],
                                id: "",
                                description: '',
                                isPremium: true,
                                isPrivate: true,
                                rating: 5,
                                title: '',
                                thumbnailUrl:
                                'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
                              ),
                            ),
                          );
                        },
                        backgroundColor: AppColor.lightBlue,
                      );
                    },
                    options: CarouselOptions(
                      height: 350,
                      viewportFraction: .95,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
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