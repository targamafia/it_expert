import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_expert/ui/home/history/history_controller.dart';
import 'package:it_expert/ui/style.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HistoryPageController controller = Get.put(HistoryPageController());
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectionArea(
                          child: Text(
                            'Mi historial',
                            style: Theme.of(context).textTheme.headlineMedium
                          )),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SelectionArea(
                                              child: Text(
                                                'Examen',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              )),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SelectionArea(
                                              child: Text(
                                                '7/11/22',
                                                style: Theme.of(context).textTheme.labelLarge
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SelectionArea(
                                              child: Text(
                                                'Calificación: ',
                                                style: Theme.of(context).textTheme.bodyMedium,
                                              )),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SelectionArea(
                                              child: Text(
                                                '83/100',
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.correctGreen),
                                              )),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                            Icon(
                                            Icons.refresh,
                                            color: Colors.black,
                                            size: 32,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
  }
}
