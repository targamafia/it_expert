import 'package:flutter/material.dart';
import 'package:it_expert/ui/home/profile/user_premium_exams/user_premium_exams_controller.dart';
import 'package:flutter/rendering.dart';


class UserPremiumExams extends StatelessWidget {
  const UserPremiumExams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPremiumExamsController controller = UserPremiumExamsController();

    return Scaffold(body:Padding(padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0)));
  }
}
