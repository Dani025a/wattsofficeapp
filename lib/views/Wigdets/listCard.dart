// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/models/seatingAndFoodPlanModel.dart';

import '../../Controllers/sharedController.dart';

class ListItemCard extends StatefulWidget {
  final String currentime;
  const ListItemCard({
    Key? key,
    required this.currentime,
  }) : super(key: key);

  @override
  State<ListItemCard> createState() => _ListItemCardState();
}

class _ListItemCardState extends State<ListItemCard> {
  late final Stream<List<SeatingAndFoodPlanModel>> streamData;
  @override
  void initState() {
    super.initState();
    streamData = SharedController.getData(widget.currentime);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SeatingAndFoodPlanModel>>(
        stream: SharedController.getData(widget.currentime.toString()),
        builder: (context, snapshot1) {
          switch (snapshot1.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot1.hasError) {
                print(snapshot1.error);
                return buildText('Something Went Wrong Try later');
              } else {
                final data = snapshot1.data;
                if (data!.isEmpty) {
                  return buildText('No Users Found');
                } else {
                  return Expanded(
                      child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: data.map(cardUserData).toList(),
                  ));
                }
              }
          }
        });
  }

  Widget cardUserData(SeatingAndFoodPlanModel data) => Card(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: SelectionArea(
                            child: Text(
                          'Navn: ${data.firstName} ${data.lastName}',
                        )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (data.whereAreYou == 0) ...[
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text("På kontoret",
                                style: TextStyle(color: Colors.green)))
                      ] else if (data.whereAreYou == 1) ...[
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 20, 0),
                            child: Text("Hjemme",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 230, 208, 1)))),
                      ] else if (data.whereAreYou == 2) ...[
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text("Syg eller på ferie",
                                style: TextStyle(color: Colors.red)))
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      );
}
