// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/models/userModel.dart';
import 'package:wattsofficeapp/views/Wigdets/seatInfoPopUp.dart';
import 'package:wattsofficeapp/views/Wigdets/updatePermanentSeatPopUp.dart';
import 'package:wattsofficeapp/views/Wigdets/updateSeatPopUp.dart';

import '../../Controllers/sharedController.dart';
import '../../models/seatingAndFoodPlanModel.dart';
import '../../utils/utils.dart';

class PermanentFloorPlanTwo extends StatefulWidget {
  final List<UserModel> data;
  const PermanentFloorPlanTwo({Key? key, required this.data}) : super(key: key);

  @override
  State<PermanentFloorPlanTwo> createState() => _PermanentFloorPlanTwoState();
}

class _PermanentFloorPlanTwoState extends State<PermanentFloorPlanTwo> {
  @override
  Widget build(BuildContext context) {
    int? userIndex = null;
    final data = widget.data;
    double width = MediaQuery.of(context).size.width;
    double seatwidth = MediaQuery.of(context).size.width * 0.25;
    return Stack(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            child: Stack(children: [
              Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0, width * 0.032, 0, 0),
                  child: Image.asset(
                    'assets/Rooms.png',
                    fit: BoxFit.cover,
                    width: width,
                  )),
              Padding(
                padding: EdgeInsetsDirectional.only(top: width * 0.20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            seatOne(Utils().getIndexForPermanentSeat(data, 16),
                                seatwidth, data, () {
                              SharedController()
                                  .permanentSeat(data, context, 16);
                            }),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            seatOne(Utils().getIndexForPermanentSeat(data, 17),
                                seatwidth, data, () {
                              SharedController()
                                  .permanentSeat(data, context, 17);
                            }),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: width * 0.2),
                              child: seatOne(
                                  Utils().getIndexForPermanentSeat(data, 18),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 18);
                              }),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: width * 0.39),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            seatTwo(Utils().getIndexForPermanentSeat(data, 19),
                                seatwidth, data, () {
                              SharedController()
                                  .permanentSeat(data, context, 19);
                            }),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            seatTwo(Utils().getIndexForPermanentSeat(data, 20),
                                seatwidth, data, () {
                              SharedController()
                                  .permanentSeat(data, context, 20);
                            }),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: width * 0.2),
                              child: seatTwo(
                                  Utils().getIndexForPermanentSeat(data, 21),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 21);
                              }),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: width * 1.33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            seatOne(Utils().getIndexForPermanentSeat(data, 22),
                                seatwidth, data, () {
                              SharedController()
                                  .permanentSeat(data, context, 22);
                            }),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: width * 0.2),
                              child: seatOne(
                                  Utils().getIndexForPermanentSeat(data, 23),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 23);
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            seatOne(Utils().getIndexForPermanentSeat(data, 24),
                                seatwidth, data, () {
                              SharedController()
                                  .permanentSeat(data, context, 24);
                            }),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: width * 0.2),
                              child: seatOne(
                                  Utils().getIndexForPermanentSeat(data, 25),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 25);
                              }),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: width * 1.52),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            seatTwo(Utils().getIndexForPermanentSeat(data, 26),
                                seatwidth, data, () {
                              SharedController()
                                  .permanentSeat(data, context, 26);
                            }),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: width * 0.2),
                              child: seatTwo(
                                  Utils().getIndexForPermanentSeat(data, 27),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 27);
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            seatTwo(Utils().getIndexForPermanentSeat(data, 28),
                                seatwidth, data, () {
                              SharedController()
                                  .permanentSeat(data, context, 28);
                            }),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: width * 0.2),
                              child: seatTwo(
                                  Utils().getIndexForPermanentSeat(data, 29),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 29);
                              }),
                            )
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
          padding:
              EdgeInsetsDirectional.only(top: width * 1.015, end: width * 0.97),
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
    ]);
  }

  Widget seatOne(int? seatNumber, double width, List<UserModel> data,
          VoidCallback onTap) =>
      Stack(children: <Widget>[
        if (seatNumber == null || data == null)
          Stack(
            children: [
              GestureDetector(
                  onTap: onTap,
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
          )
        else
          Column(
            children: [
              GestureDetector(
                  onTap: onTap,
                  child: Stack(
                    children: [
                      RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset(
                          'assets/deskIcon.png',
                          color: FirebaseAuth.instance.currentUser!.uid ==
                                  data[seatNumber].uid
                              ? Color.fromARGB(255, 36, 36, 36)
                              : Colors.red,
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
                                    data[seatNumber].initials,
                                    style: TextStyle(
                                      fontSize: width * 0.285,
                                      fontWeight: FontWeight.bold,
                                      color: FirebaseAuth
                                                  .instance.currentUser!.uid ==
                                              data[seatNumber].uid
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ))),
                    ],
                  ))
            ],
          )
      ]);

  Widget seatTwo(int? seatNumber, double width, List<UserModel> data,
          VoidCallback onTap) =>
      Stack(children: <Widget>[
        if (seatNumber == null || data == null)
          Stack(
            children: [
              GestureDetector(
                  onTap: onTap,
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
          )
        else
          Column(
            children: [
              GestureDetector(
                  onTap: onTap,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/deskIcon.png',
                        color: FirebaseAuth.instance.currentUser!.uid ==
                                data[seatNumber].uid
                            ? Color.fromARGB(255, 36, 36, 36)
                            : Colors.red,
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
                                    data[seatNumber].initials,
                                    style: TextStyle(
                                      fontSize: width * 0.285,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'signature',
                                      color: FirebaseAuth
                                                  .instance.currentUser!.uid ==
                                              data[seatNumber].uid
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ))),
                    ],
                  ))
            ],
          )
      ]);
}
