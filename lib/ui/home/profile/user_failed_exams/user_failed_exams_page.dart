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

class UserFailedExams extends StatefulWidget {
  const UserFailedExams({Key? key}) : super(key: key);

  @override
  State<UserFailedExams> createState() => _UserFailedExamsState();
}


class _UserFailedExamsState extends State<UserFailedExams> {
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
                    "¡No te rindas!",
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
                          title: "CCNA",
                          description: "Mucha descripciòn",
                          categories: ["IoT", "CISCO", "CCNA II"],
                          id: '',
                          isPremium: false,
                          isPrivate: true,
                          rating: 5,
                          thumbnailUrl:
                            'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
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
                                title: 'Fundamentos de programación',
                                thumbnailUrl:
                                  'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1769&q=80',
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