// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:string_ext/string_ext.dart';
import 'package:wattsofficeapp/Controllers/sharedController.dart';
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/views/Wigdets/floorPlanOne.dart';
import 'package:wattsofficeapp/views/Wigdets/floorPlanTwo.dart';

import '../../models/dateModel.dart';
import '../../utils/utils.dart';

class FloorPlanScreen extends StatefulWidget {
  final DateTime? currentime;
  final bool popup;
  const FloorPlanScreen({
    Key? key,
    this.currentime,
    required this.popup,
  }) : super(key: key);

  @override
  State<FloorPlanScreen> createState() => _FloorPlanScreenState();
}

class _FloorPlanScreenState extends State<FloorPlanScreen> {
  List<bool> isSelected = [true, false];
  bool vertical = false;
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
    bool popup = widget.popup;

    return Scaffold(
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
                      final datemodel = snapshot1.data;

                      if (datemodel!.isEmpty) {
                        return buildText(LocaleKeys.noData.tr());
                      } else {
                        if (popup == true) {
                          currentime = widget.currentime!;
                          choosendate = widget.currentime!;
                          popup = false;
                        }
                        currentdateindex = Utils()
                            .getCurrentDate(datemodel, currentime, false);
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
                          ToggleButtons(
                            isSelected: isSelected,
                            selectedColor: Colors.white,
                            color: Colors.black,
                            fillColor: Colors.black,
                            splashColor: Colors.black,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            borderRadius: BorderRadius.circular(5),
                            selectedBorderColor: Colors.black,
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 120.0,
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.15,
                                    vertical: width * 0.03),
                                child: Text(LocaleKeys.roomOne.tr(),
                                    style: TextStyle(fontSize: width * 0.055)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.15,
                                    vertical: width * 0.03),
                                child: Text(LocaleKeys.roomTwo.tr(),
                                    style: TextStyle(fontSize: width * 0.055)),
                              ),
                            ],
                            onPressed: (int newIndex) {
                              setState(() {
                                for (int index = 0;
                                    index < isSelected.length;
                                    index++) {
                                  if (index == newIndex) {
                                    isSelected[index] = true;
                                  } else {
                                    isSelected[index] = false;
                                  }
                                }
                              });
                            },
                          ),
                        ]);
                      }
                    }
                }
              }),
          if (popup == true) ...[
            if (isSelected[0] == true)
              FloorPlanOne(
                currentime:
                    Utils.dateFormat.format(widget.currentime!).toString(),
              )
            else if (isSelected[1] == true)
              FloorPlanTwo(
                  currentime:
                      Utils.dateFormat.format(widget.currentime!).toString())
          ] else if (isSelected[0] == true)
            FloorPlanOne(
              currentime: Utils.dateFormat.format(choosendate).toString(),
            )
          else if (isSelected[1] == true)
            FloorPlanTwo(
                currentime: Utils.dateFormat.format(choosendate).toString())
        ]));
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
