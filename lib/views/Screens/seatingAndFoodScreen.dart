// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_ext/string_ext.dart';
import 'package:wattsofficeapp/Controllers/sharedController.dart';
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/models/dateModel.dart';
import 'package:wattsofficeapp/views/Screens/settingsScreen.dart';
import 'package:wattsofficeapp/views/Wigdets/seatingItemCard.dart';
import 'package:wattsofficeapp/utils/utils.dart' as dateUtils;
import 'package:get/get.dart' hide Trans;

import '../../utils/utils.dart';

class SeatingAndFoodScreen extends StatefulWidget {
  const SeatingAndFoodScreen({Key? key}) : super(key: key);

  @override
  State<SeatingAndFoodScreen> createState() => _SeatingAndFoodScreenState();
}

class _SeatingAndFoodScreenState extends State<SeatingAndFoodScreen> {
  DateTime currentime = DateTime.now();

  late final Stream<List<DateModel>> streamData;
  int currentdateindex = 0;
  late int index = currentdateindex;
  @override
  void initState() {
    super.initState();

    streamData = SharedController.getDates();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.floorPlan.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: Column(children: <Widget>[
          StreamBuilder<List<DateModel>>(
              stream: streamData,
              builder: (context, snapshot1) {
                switch (snapshot1.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot1.hasError) {
                      return buildText('Something Went Wrong Try later');
                    } else {
                      final datemodel = snapshot1.data;
                      if (datemodel!.isEmpty) {
                        return buildText('No Data Found');
                      } else {
                        currentdateindex =
                            Utils().getCurrentDate(datemodel, currentime, true);
                        return Column(children: <Widget>[
                          Column(children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                setState(() {
                                                  if (index !=
                                                      datemodel.length - 1) {
                                                    index = index + 5;
                                                    currentime =
                                                        datemodel[index].date!;
                                                  }
                                                });
                                              });
                                            },
                                            child: Icon(Icons.arrow_back_ios),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 5, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${Utils.dateFormat.format(datemodel[index].date!)} - ${Utils.dateFormat.format(datemodel[index - 4].date!)}",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .only(top: 5),
                                                        child: Text(
                                                          LocaleKeys
                                                              .whereareyourcoworkers
                                                              .tr(),
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                if (index != 0 && index != 4) {
                                                  index = index - 5;
                                                  currentime =
                                                      datemodel[index].date!;
                                                }
                                              });
                                            },
                                            child:
                                                Icon(Icons.arrow_forward_ios),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ]);
                      }
                    }
                }
              })
        ]));
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
