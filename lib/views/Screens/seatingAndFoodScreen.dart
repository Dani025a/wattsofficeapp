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

import '../../models/seatingAndFoodPlanModel.dart';
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
  int weekNumber = 0;
  late int cardIndex = currentdateindex;
  late int stopIndex = currentdateindex - 4;
  @override
  void initState() {
    super.initState();

    streamData = SharedController.getDates();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: height * 0.07,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.floorPlan.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.06,
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
                      return buildText(LocaleKeys.somethingWentWrong.tr());
                    } else {
                      final datamodel = snapshot1.data;
                      if (datamodel!.isEmpty) {
                        return buildText(LocaleKeys.noData.tr());
                      } else {
                        currentdateindex =
                            Utils().getCurrentDate(datamodel, currentime, true);
                        weekNumber = Utils().weekNumber(currentime, true);
                        if (index == 4) {
                          stopIndex = 0;
                        }
                        final children = <Widget>[];
                        for (cardIndex; cardIndex >= stopIndex; cardIndex--) {
                          children.add(SeatingItemCard(
                              dateIndex: cardIndex, dateData: datamodel));
                        }
                        return Expanded(
                            child: Column(children: [
                          Column(children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, height * 0.03, 0, 0),
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
                                          SizedBox(
                                              height: height * 0.1,
                                              width: width * 0.2,
                                              child: MaterialButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (index !=
                                                          datamodel.length -
                                                              1) {
                                                        index = index + 5;
                                                        currentime =
                                                            datamodel[index]
                                                                .date!;
                                                        weekNumber = Utils()
                                                            .weekNumber(
                                                                currentime,
                                                                true);
                                                        cardIndex = index;
                                                        stopIndex = index - 4;
                                                      } else {
                                                        cardIndex = index;
                                                      }
                                                    });
                                                  },
                                                  child: SizedBox(
                                                    height: height * 1,
                                                    width: width * 1,
                                                    child: Icon(
                                                      Icons.arrow_back_ios,
                                                    ),
                                                  ))),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    height * 0.01,
                                                    0,
                                                    height * 0.01,
                                                    0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "${LocaleKeys.week.tr()} $weekNumber",
                                                        style: TextStyle(
                                                          fontSize:
                                                              width * 0.05,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ]),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${Utils.dateFormat.format(datamodel[index].date!)} - ${Utils.dateFormat.format(datamodel[index - 4].date!)}",
                                                      style: TextStyle(
                                                        fontSize: width * 0.042,
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
                                                                .only(
                                                                    top:
                                                                        height *
                                                                            0.01,
                                                                    bottom:
                                                                        height *
                                                                            0.01),
                                                        child: Text(
                                                          LocaleKeys.whereareyou
                                                              .tr(),
                                                          style: TextStyle(
                                                            fontSize:
                                                                width * 0.035,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: height * 0.1,
                                              width: width * 0.2,
                                              child: MaterialButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (index != 0 &&
                                                        index != 4) {
                                                      index = index - 5;
                                                      currentime =
                                                          datamodel[index]
                                                              .date!;
                                                      weekNumber = Utils()
                                                          .weekNumber(
                                                              currentime, true);
                                                      cardIndex = index;
                                                      stopIndex = index - 4;
                                                    } else {
                                                      cardIndex = index;
                                                      stopIndex = 0;
                                                    }
                                                  });
                                                },
                                                child: SizedBox(
                                                  height: height * 1,
                                                  width: width * 1,
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          Expanded(
                            child: ListView(shrinkWrap: true, children: [
                              Column(
                                children: children,
                              ),
                            ]),
                          )
                        ]));
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
