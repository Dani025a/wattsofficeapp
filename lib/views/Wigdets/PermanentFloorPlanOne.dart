// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wattsofficeapp/models/userModel.dart';
import 'package:wattsofficeapp/utils/utils.dart';
import 'package:wattsofficeapp/views/Wigdets/seatInfoPopUp.dart';
import 'package:wattsofficeapp/views/Wigdets/updatePermanentSeatPopUp.dart';

import '../../Controllers/sharedController.dart';
import '../../models/seatingAndFoodPlanModel.dart';

class PermanentFloorPlanOne extends StatefulWidget {
  final List<UserModel> data;
  const PermanentFloorPlanOne({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PermanentFloorPlanOne> createState() => _PermanentFloorPlanOneState();
}

class _PermanentFloorPlanOneState extends State<PermanentFloorPlanOne> {
  late final Stream<List<SeatingAndFoodPlanModel>> streamData;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    int? userIndex = Utils().getCurrentUser(data);
    double width = MediaQuery.of(context).size.width;
    double seatwidth = MediaQuery.of(context).size.width * 0.25;
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              child: Stack(children: [
                Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0, width * 0.02, 0, 0),
                    child: Image.asset(
                      'assets/Rooms.png',
                      fit: BoxFit.cover,
                      width: width,
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.only(top: width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                seatOne(
                                    Utils().getIndexForPermanentSeat(data, 1),
                                    seatwidth,
                                    data, () {
                                  SharedController()
                                      .permanentSeat(data, context, 1);
                                }),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Stack(
                              children: [
                                seatOne(
                                    Utils().getIndexForPermanentSeat(data, 2),
                                    seatwidth,
                                    data, () {
                                  SharedController()
                                      .permanentSeat(data, context, 2);
                                }),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: width * 0.2),
                                  child: seatOne(
                                      Utils().getIndexForPermanentSeat(data, 3),
                                      seatwidth,
                                      data, () {
                                    SharedController()
                                        .permanentSeat(data, context, 3);
                                  }),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: width * 0.21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              seatTwo(Utils().getIndexForPermanentSeat(data, 4),
                                  seatwidth, data, () {
                                SharedController()
                                    .permanentSeat(data, context, 4);
                              }),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              seatTwo(Utils().getIndexForPermanentSeat(data, 5),
                                  seatwidth, data, () {
                                SharedController()
                                    .permanentSeat(data, context, 5);
                              }),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: width * 0.2),
                                child: seatTwo(
                                    Utils().getIndexForPermanentSeat(data, 6),
                                    seatwidth,
                                    data, () {
                                  SharedController()
                                      .permanentSeat(data, context, 6);
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
                                seatOne(
                                    Utils().getIndexForPermanentSeat(data, 7),
                                    seatwidth,
                                    data, () {
                                  SharedController()
                                      .permanentSeat(data, context, 7);
                                }),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: width * 0.2),
                                  child: seatOne(
                                      Utils().getIndexForPermanentSeat(data, 8),
                                      seatwidth,
                                      data, () {
                                    SharedController()
                                        .permanentSeat(data, context, 8);
                                  }),
                                )
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
                          padding:
                              EdgeInsetsDirectional.only(top: width * 0.95),
                          child: seatOne(
                              Utils().getIndexForPermanentSeat(data, 9),
                              seatwidth,
                              data, () {
                            SharedController()
                                .permanentSeat(data, context, 9);
                          }),
                        )
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
                          padding:
                              EdgeInsetsDirectional.only(top: width * 1.14),
                          child: seatTwo(
                              Utils().getIndexForPermanentSeat(data, 10),
                              seatwidth,
                              data, () {
                            SharedController()
                                .permanentSeat(data, context, 10);
                          }),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: width * 1.33),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              seatOne(
                                  Utils().getIndexForPermanentSeat(data, 11),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 11);
                              }),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: width * 0.2),
                                child: seatOne(
                                    Utils().getIndexForPermanentSeat(data, 12),
                                    seatwidth,
                                    data, () {
                                  SharedController()
                                      .permanentSeat(data, context, 12);
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
                              seatTwo(
                                  Utils().getIndexForPermanentSeat(data, 13),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 13);
                              }),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              seatTwo(
                                  Utils().getIndexForPermanentSeat(data, 14),
                                  seatwidth,
                                  data, () {
                                SharedController()
                                    .permanentSeat(data, context, 14);
                              }),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: width * 0.2),
                                child: seatTwo(
                                    Utils().getIndexForPermanentSeat(data, 15),
                                    seatwidth,
                                    data, () {
                                  SharedController()
                                      .permanentSeat(data, context, 15);
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
    );
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
