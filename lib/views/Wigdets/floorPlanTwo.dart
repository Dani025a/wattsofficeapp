// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';

import '../../Controllers/sharedController.dart';
import '../../models/seatingAndFoodPlanModel.dart';
import '../../utils/utils.dart';

class FloorPlanTwo extends StatefulWidget {
  final String currentime;
  const FloorPlanTwo({Key? key, required this.currentime}) : super(key: key);

  @override
  State<FloorPlanTwo> createState() => _FloorPlanTwoState();
}

class _FloorPlanTwoState extends State<FloorPlanTwo> {
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
                  Stack(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width,
                          child: Stack(children: [
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, width * 0.032, 0, 0),
                                child: Image.asset(
                                  'assets/Rooms.png',
                                  fit: BoxFit.cover,
                                  width: width,
                                )),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.only(top: width * 0.20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatOne(16, width, data!),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatOne(17, width, data),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatOne(18, width, data))
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.only(top: width * 0.39),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatTwo(19, width, data),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatTwo(20, width, data),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatTwo(21, width, data))
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.only(top: width * 1.33),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatOne(22, width, data),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatOne(23, width, data))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatOne(24, width, data),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatOne(25, width, data))
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.only(top: width * 1.52),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatTwo(26, width, data),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatTwo(27, width, data))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatTwo(28, width, data),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatTwo(29, width, data))
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: width * 0.425,
                                  top: width * 1.705,
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/door.png',
                                      fit: BoxFit.cover,
                                      width: width * 0.15,
                                      height: width * 0.15,
                                    ),
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.only(
                            top: width * 1.015, end: width * 0.97),
                        child: Stack(
                          children: [
                            RotatedBox(
                              quarterTurns: 2,
                              child: Image.asset(
                                'assets/line.png',
                                fit: BoxFit.cover,
                                color: Colors.white,
                                width: width * 0.3,
                                height: width * 0.3,
                              ),
                            ),
                          ],
                        )),
                    Row(children: [
                      Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: width * 0.07,
                          ),
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: Image.asset(
                                  'assets/door.png',
                                  fit: BoxFit.cover,
                                  width: width * 0.15,
                                  height: width * 0.15,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: width * 0.10,
                          ),
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: Image.asset(
                                  'assets/door.png',
                                  fit: BoxFit.cover,
                                  width: width * 0.15,
                                  height: width * 0.15,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: width * 0.14,
                          ),
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
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
                  ])
                ],
              ));
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
