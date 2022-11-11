import 'package:flutter/material.dart';
import 'package:it_expert/ui/home/profile/user_premium_assessments/user_premium_assessments_controller.dart';
import 'package:flutter/rendering.dart';


class UserPremiumAssessments extends StatelessWidget {
  const UserPremiumAssessments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPremiumAssessmentsController controller = UserPremiumAssessmentsController();

    return Scaffold(body:Padding(padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0)));
  }
}
