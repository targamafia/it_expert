import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/profile/profile_controller.dart';
import 'package:it_expert/ui/home/profile/user_premium_exams/user_premium_exams_page.dart';
import 'package:it_expert/ui/user/login/login_page.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:it_expert/ui/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = Get.put(ProfilePageController());
    controller.fetchUserData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            width: 180,
            height: 180,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/3940/3940410.png',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            controller.getUserName(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ), // User name
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: _createStatsCard(context, "Exámenes realizados", Icons.school_rounded, controller.takenAssessments)
            ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => UserPremiumExams());
                    },
                    child: _createStatsCard(context, "Exámenes premium", Icons.star_rate_rounded, controller.premiumAssessments)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),// First stats
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xFFF5F5F5),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () => launchUrlString(
                          'https://mrpcapacitacion.mx/product-category/cursos/'),
                      child: _createButtonCard(context, "Explorar cursos MRP", Icons.travel_explore)),
                  GestureDetector(
                      onTap: () => launchUrlString(
                          'https://mrpcapacitacion.mx/contact/'),
                      child: _createButtonCard(context, "Contacto", Icons.contact_support_rounded)),
                  GestureDetector(
                      onTap: ([bool mounted = true]) async {
                        var response = await controller.logOut();
                        if (response) {
                          Get.to(() => LoginPage());
                        } else {
                          print(response);
                        }
                        ;
                      },
                      child: _createButtonCard(context, "Cerrar Sesión", Icons.exit_to_app)),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


Widget _createStatsCard(BuildContext context, String text, IconData icon, String stat){
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(21),
    ),
    child: Container(
        padding: EdgeInsets.all(10),
        color: AppColor.aliceBlue,
        constraints: const BoxConstraints(
          maxHeight: 150,
          maxWidth: 180,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              stat,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        )),
  );
}

Widget _createButtonCard(BuildContext context, String text, IconData icon){
  return Card(
    child:Container(
        color: AppColor.white,
        padding: EdgeInsets.all(10),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
              size: 32,
            ),
          ],
        )
    )
  );
}
