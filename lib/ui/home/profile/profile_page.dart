import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/history/history_page.dart';
import 'package:it_expert/ui/home/profile/profile_controller.dart';
import 'package:it_expert/ui/home/profile/user_premium_assessments/user_premium_assessments_page.dart';
import 'package:it_expert/ui/home/profile/user_taken_assessments/user_taken_assessments_page.dart';
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
            height: 20,
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
            height: 24,
          ),
          Obx(() {
            return Text(
              controller.name.value + " " + controller.lastName.value,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            );
          }), // User name
          Row(
            children: [
              ProfileStatCard(
                  icon: Icon(Icons.school_rounded),
                  text: "Examenes contestados",
                  n: 10,
                  onTap: () {
                    Get.to(() => const HistoryPage());
                  }),
              ProfileStatCard(
                  icon: Icon(Icons.star_rate_rounded),
                  text: "Exámenes Premium",
                  n: 3,
                  onTap: () {
                    Get.to(() => const PremiumAssessmentsPage());
                  }),
            ],
          ),
          SizedBox(
            height: 20,
          ), // First stats
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
                      child: _createButtonCard(context, "Explorar cursos MRP",
                          Icons.travel_explore)),
                  GestureDetector(
                      onTap: () => launchUrlString(
                          'https://mrpcapacitacion.mx/contact/'),
                      child: _createButtonCard(
                          context, "Contacto", Icons.contact_support_rounded)),
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
                      child: _createButtonCard(
                          context, "Cerrar Sesión", Icons.exit_to_app)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _createButtonCard(BuildContext context, String text, IconData icon) {
  return Card(
    child: Container(
      color: AppColor.white,
      padding: EdgeInsets.all(10),
      child: Row(
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
                ?.copyWith(fontWeight: FontWeight.normal),
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
      ),
    ),
  );
}

class ProfileStatCard extends StatefulWidget {
  ProfileStatCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.n,
      required this.onTap});
  Icon icon;
  String text;
  int n;
  void Function() onTap;

  @override
  State<ProfileStatCard> createState() => _ProfileStatCardState();
}

class _ProfileStatCardState extends State<ProfileStatCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        child: Container(
          width: context.width * .45,
          color: AppColor.aliceBlue,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.icon,
              Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.n.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
