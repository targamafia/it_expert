import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = Get.put(ProfilePageController());
    controller.loadProfileData();
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
              padding: EdgeInsetsDirectional.fromSTEB(0, newheight/6, 0, 0),
              child: SelectionArea(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: SelectionArea(
                      child: Text(
                    controller.name + " " + controller.lastName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
                ),
              )),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, newheight/8, 0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.school_rounded,
                                color: Colors.black,
                                size: 24,
                              ),
                              SelectionArea(
                                  child: Text(
                                'Exámenes contestados',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                              )),
                              SelectionArea(
                                  child: Text(
                                '2',
                                style: TextStyle(fontSize: 30),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.black,
                                size: 24,
                              ),
                              SelectionArea(
                                  child: Text(
                                'Exámenes premium',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                              )),
                              SelectionArea(
                                  child: Text(
                                '0',
                                style: TextStyle(fontSize: 30),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
            padding:  EdgeInsetsDirectional.fromSTEB(0, newheight/30, 0, 0),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, newheight/10, 0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.contact_support_rounded,
                                color: Colors.black,
                                size: 32,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'Soporte',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.normal),
                                  )),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black,
                                size: 32,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.black,
                                size: 32,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'Cerrar Sesión',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.normal),
                                  )),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black,
                                size: 32,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
