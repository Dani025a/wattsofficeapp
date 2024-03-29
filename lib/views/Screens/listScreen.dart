// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_ext/string_ext.dart';
import 'package:wattsofficeapp/Controllers/sharedController.dart';
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/models/dateModel.dart';
import 'package:get/get.dart' hide Trans;

import '../../models/seatingAndFoodPlanModel.dart';
import '../../utils/utils.dart';
import '../Wigdets/listCard.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  DateTime currentime = DateTime.now();

  late final Stream<List<DateModel>> streamData;
  int currentdateindex = 0;
  late int index = currentdateindex;
  late DateTime choosendate = currentime;

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: height * 0.07,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.seatingList.tr(),
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
                      final datemodel = snapshot1.data;
                      currentdateindex =
                          Utils().getCurrentDate(datemodel!, currentime, false);
                      if (datemodel.isEmpty) {
                        return buildText(LocaleKeys.noData.tr());
                      } else {
                        return Column(children: <Widget>[
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
                                                          datemodel.length -
                                                              1) {
                                                        index = index + 1;
                                                        choosendate =
                                                            datemodel[index]
                                                                .date!;
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
                                                        "${Utils.dayFormat.format(datemodel[index].date!).firstToUpper()} ",
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
                                                      Utils.dateFormat.format(
                                                          datemodel[index]
                                                              .date!),
                                                      style: TextStyle(
                                                        fontSize: width * 0.05,
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
                                                    if (index != 0) {
                                                      index = index - 1;
                                                      choosendate =
                                                          datemodel[index]
                                                              .date!;
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
                        ]);
                      }
                    }
                }
              }),
          StreamBuilder<List<SeatingAndFoodPlanModel>>(
              stream: SharedController.getData(
                  Utils.dateFormat.format(choosendate).toString()),
              builder: (context, snapshot1) {
                switch (snapshot1.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot1.hasError) {
                      print(snapshot1.error);
                      return buildText(LocaleKeys.somethingWentWrong.tr());
                    } else {
                      final data = snapshot1.data;
                      if (data!.isEmpty) {
                        return buildText(LocaleKeys.noData.tr());
                      } else {
                        return Expanded(child: ListItemCard(data: data));
                      }
                    }
                }
              })
        ]));
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      );
}
