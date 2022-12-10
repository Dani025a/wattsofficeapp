// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/utils/utils.dart';
import 'dart:math' as math;

import '../../Controllers/sharedController.dart';
import '../../models/seatingAndFoodPlanModel.dart';

class FloorPlanOne extends StatefulWidget {
  final String currentime;
  const FloorPlanOne({
    Key? key,
    required this.currentime,
  }) : super(key: key);

  @override
  State<FloorPlanOne> createState() => _FloorPlanOneState();
}

class _FloorPlanOneState extends State<FloorPlanOne> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder<List<SeatingAndFoodPlanModel>>(
        stream: SharedController.getData(widget.currentime.toString()),
        builder: (context, snapshot1) {
          final data = snapshot1.data;
          switch (snapshot1.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return Expanded(
                  child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width,
                              child: Stack(children: [
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Image.asset(
                                      'assets/Rooms.png',
                                      fit: BoxFit.cover,
                                      width: width,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            seatOne(1, width, data!),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            seatOne(2, width, data),
                                            Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        start: width * 0.2),
                                                child: seatOne(3, width, data))
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      top: width * 0.19),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              seatTwo(4, width, data),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              seatTwo(5, width, data),
                                              Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(start: width * 0.2),
                                                  child:
                                                      seatTwo(6, width, data))
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        top: width * 0.45, start: width * 0.2),
                                    child: Stack(children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                              start: width * 0.05,
                                            ),
                                            child: Stack(
                                              children: [
                                                seatOne(7, width, data),
                                                Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                start: width *
                                                                    0.2),
                                                    child:
                                                        seatOne(8, width, data))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          top: width * 0.21,
                                        ),
                                        child: Image.asset(
                                          'assets/Stairs.png',
                                          fit: BoxFit.cover,
                                          width: width * 0.60,
                                        ),
                                      )
                                    ])),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                top: width * 0.95),
                                            child: seatOne(9, width, data))
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                top: width * 1.14),
                                            child: seatTwo(10, width, data))
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      top: width * 1.33),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              seatOne(11, width, data),
                                              Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(start: width * 0.2),
                                                  child:
                                                      seatOne(12, width, data))
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      top: width * 1.52),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              seatTwo(13, width, data),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              seatTwo(14, width, data),
                                              Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(start: width * 0.2),
                                                  child:
                                                      seatTwo(15, width, data))
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        top: width * 1.32, end: width * 0.9),
                                    child: Stack(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Image.asset(
                                            'assets/door.png',
                                            fit: BoxFit.cover,
                                            width: width * 0.15,
                                            height: width * 0.15,
                                          ),
                                        )
                                      ],
                                    ))
                              ]),
                            )
                          ],
                        )
                      ],
                    )
                  ]));
          }
        });
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );

  Widget seatOne(int seatNumber, double width,
          final List<SeatingAndFoodPlanModel> data) =>
      Builder(builder: (context) {
        Color deskColor = Colors.red;
        Color deskTextColor = Colors.black;
        int? seatIndex;
        width = width * 0.25;
        seatIndex = Utils().getIndexForSeat(data, seatNumber);
        if (seatIndex == null) {
          return Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset(
                          'assets/deskIcon.png',
                          color: Colors.green,
                          fit: BoxFit.cover,
                          width: width,
                          height: width,
                        ),
                      ),
                    ],
                  ))
            ],
          );
        } else {
          if (FirebaseAuth.instance.currentUser!.uid == data[seatIndex].uid) {
            deskColor = Color.fromARGB(255, 36, 36, 36);
            deskTextColor = Colors.white;
          }
          return Column(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset(
                          'assets/deskIcon.png',
                          color: deskColor,
                          fit: BoxFit.cover,
                          width: width,
                          height: width,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: width * 0.137, top: width * 0.453),
                          child: Container(
                              width: width * 0.73,
                              height: width * 0.385,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    data[seatIndex].initials!,
                                    style: TextStyle(
                                        fontSize: width * 0.285,
                                        fontWeight: FontWeight.bold,
                                        color: deskTextColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ))),
                    ],
                  ))
            ],
          );
        }
      });

  Widget seatTwo(int seatNumber, double width,
          final List<SeatingAndFoodPlanModel> data) =>
      Builder(builder: (context) {
        Color deskColor = Colors.red;
        Color deskTextColor = Colors.black;
        int? seatIndex;
        width = width * 0.25;
        seatIndex = Utils().getIndexForSeat(data, seatNumber);
        if (seatIndex == null) {
          return Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/deskIcon.png',
                        color: Colors.green,
                        fit: BoxFit.cover,
                        width: width,
                        height: width,
                      ),
                    ],
                  ))
            ],
          );
        } else {
          if (FirebaseAuth.instance.currentUser!.uid == data[seatIndex].uid) {
            deskColor = Color.fromARGB(255, 36, 36, 36);
            deskTextColor = Colors.white;
          }
          return Column(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/deskIcon.png',
                        color: deskColor,
                        fit: BoxFit.cover,
                        width: width,
                        height: width,
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: width * 0.137, top: width * 0.15),
                          child: Container(
                              width: width * 0.73,
                              height: width * 0.385,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    data[seatIndex].initials!,
                                    style: TextStyle(
                                        fontSize: width * 0.285,
                                        fontWeight: FontWeight.bold,
                                        color: deskTextColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ))),
                    ],
                  ))
            ],
          );
        }
      });
}
