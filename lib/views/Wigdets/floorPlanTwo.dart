// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/views/Wigdets/seatInfoPopUp.dart';
import 'package:wattsofficeapp/views/Wigdets/updateSeatPopUp.dart';

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
  late final Stream<List<SeatingAndFoodPlanModel>> streamData;
  late Timer timer;
  late AnimationController _controller;
  bool isLoading = false;
  void startTimer() {
    Timer.periodic(const Duration(seconds: 15), (t) {
      setState(() {
        isLoading = false; //set loading to false
      });
      t.cancel(); //stops the timer
    });
  }

  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    int? userIndex = null;

    double width = MediaQuery.of(context).size.width;
    double seatwidth = MediaQuery.of(context).size.width * 0.25;
    return StreamBuilder<List<SeatingAndFoodPlanModel>>(
        stream: SharedController.getData(widget.currentime.toString()),
        builder: (context, snapshot1) {
          final data = snapshot1.data;
          switch (snapshot1.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              userIndex = Utils()
                  .getUserInfo(data!, FirebaseAuth.instance.currentUser!.uid);
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
                                          seatOne(
                                              Utils().getIndexForSeat(data, 16),
                                              seatwidth,
                                              data, () {
                                            int? index = Utils()
                                                .getIndexForSeat(data, 16);

                                            if (index == null &&
                                                data[userIndex!].seatNumber ==
                                                    0) {
                                              SharedController().addSeat(
                                                widget.currentime.toString(),
                                                16,
                                              );
                                            } else if (index == null) {
                                              UpdateSeatPopUp(
                                                  context,
                                                  widget.currentime.toString(),
                                                  16);
                                            } else if (data[userIndex!]
                                                    .seatNumber !=
                                                16) {
                                              SeatInfoPopUp(
                                                  context,
                                                  data[index].firstName!,
                                                  data[index].lastName!,
                                                  data[index].initials!,
                                                  16);
                                            }
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
                                              Utils().getIndexForSeat(data, 17),
                                              seatwidth,
                                              data, () {
                                            int? index = Utils()
                                                .getIndexForSeat(data, 17);
                                            if (index == null &&
                                                data[userIndex!].seatNumber ==
                                                    0) {
                                              SharedController().addSeat(
                                                widget.currentime.toString(),
                                                17,
                                              );
                                            } else if (index == null) {
                                              UpdateSeatPopUp(
                                                  context,
                                                  widget.currentime.toString(),
                                                  17);
                                            } else if (data[userIndex!]
                                                    .seatNumber !=
                                                17) {
                                              SeatInfoPopUp(
                                                  context,
                                                  data[index].firstName!,
                                                  data[index].lastName!,
                                                  data[index].initials!,
                                                  17);
                                            }
                                          }),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatOne(
                                                  Utils().getIndexForSeat(
                                                      data, 18),
                                                  seatwidth,
                                                  data, () {
                                                int? index = Utils()
                                                    .getIndexForSeat(data, 18);
                                                if (index == null &&
                                                    data[userIndex!]
                                                            .seatNumber ==
                                                        0) {
                                                  SharedController().addSeat(
                                                    widget.currentime
                                                        .toString(),
                                                    18,
                                                  );
                                                } else if (index == null) {
                                                  UpdateSeatPopUp(
                                                      context,
                                                      widget.currentime
                                                          .toString(),
                                                      18);
                                                } else if (data[userIndex!]
                                                        .seatNumber !=
                                                    18) {
                                                  SeatInfoPopUp(
                                                      context,
                                                      data[index].firstName!,
                                                      data[index].lastName!,
                                                      data[index].initials!,
                                                      18);
                                                }
                                              }))
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
                                          seatTwo(
                                              Utils().getIndexForSeat(data, 19),
                                              seatwidth,
                                              data, () {
                                            int? index = Utils()
                                                .getIndexForSeat(data, 19);
                                            if (index == null &&
                                                data[userIndex!].seatNumber ==
                                                    0) {
                                              SharedController().addSeat(
                                                widget.currentime.toString(),
                                                19,
                                              );
                                            } else if (index == null) {
                                              UpdateSeatPopUp(
                                                  context,
                                                  widget.currentime.toString(),
                                                  19);
                                            } else if (data[userIndex!]
                                                    .seatNumber !=
                                                19) {
                                              SeatInfoPopUp(
                                                  context,
                                                  data[index].firstName!,
                                                  data[index].lastName!,
                                                  data[index].initials!,
                                                  19);
                                            }
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
                                              Utils().getIndexForSeat(data, 20),
                                              seatwidth,
                                              data, () {
                                            int? index = Utils()
                                                .getIndexForSeat(data, 20);
                                            if (index == null &&
                                                data[userIndex!].seatNumber ==
                                                    0) {
                                              SharedController().addSeat(
                                                widget.currentime.toString(),
                                                20,
                                              );
                                            } else if (index == null) {
                                              UpdateSeatPopUp(
                                                  context,
                                                  widget.currentime.toString(),
                                                  20);
                                            } else if (data[userIndex!]
                                                    .seatNumber !=
                                                20) {
                                              SeatInfoPopUp(
                                                  context,
                                                  data[index].firstName!,
                                                  data[index].lastName!,
                                                  data[index].initials!,
                                                  20);
                                            }
                                          }),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatTwo(
                                                  Utils().getIndexForSeat(
                                                      data, 21),
                                                  seatwidth,
                                                  data, () {
                                                int? index = Utils()
                                                    .getIndexForSeat(data, 21);
                                                if (index == null &&
                                                    data[userIndex!]
                                                            .seatNumber ==
                                                        0) {
                                                  SharedController().addSeat(
                                                    widget.currentime
                                                        .toString(),
                                                    21,
                                                  );
                                                } else if (index == null) {
                                                  UpdateSeatPopUp(
                                                      context,
                                                      widget.currentime
                                                          .toString(),
                                                      21);
                                                } else if (data[userIndex!]
                                                        .seatNumber !=
                                                    21) {
                                                  SeatInfoPopUp(
                                                      context,
                                                      data[index].firstName!,
                                                      data[index].lastName!,
                                                      data[index].initials!,
                                                      21);
                                                }
                                              }))
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
                                          seatOne(
                                              Utils().getIndexForSeat(data, 22),
                                              seatwidth,
                                              data, () {
                                            int? index = Utils()
                                                .getIndexForSeat(data, 22);
                                            if (index == null &&
                                                data[userIndex!].seatNumber ==
                                                    0) {
                                              SharedController().addSeat(
                                                widget.currentime.toString(),
                                                22,
                                              );
                                            } else if (index == null) {
                                              UpdateSeatPopUp(
                                                  context,
                                                  widget.currentime.toString(),
                                                  22);
                                            } else if (data[userIndex!]
                                                    .seatNumber !=
                                                22) {
                                              SeatInfoPopUp(
                                                  context,
                                                  data[index].firstName!,
                                                  data[index].lastName!,
                                                  data[index].initials!,
                                                  22);
                                            }
                                          }),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatOne(
                                                  Utils().getIndexForSeat(
                                                      data, 23),
                                                  seatwidth,
                                                  data, () {
                                                int? index = Utils()
                                                    .getIndexForSeat(data, 23);
                                                if (index == null &&
                                                    data[userIndex!]
                                                            .seatNumber ==
                                                        0) {
                                                  SharedController().addSeat(
                                                    widget.currentime
                                                        .toString(),
                                                    23,
                                                  );
                                                } else if (index == null) {
                                                  UpdateSeatPopUp(
                                                      context,
                                                      widget.currentime
                                                          .toString(),
                                                      23);
                                                } else if (data[userIndex!]
                                                        .seatNumber !=
                                                    23) {
                                                  SeatInfoPopUp(
                                                      context,
                                                      data[index].firstName!,
                                                      data[index].lastName!,
                                                      data[index].initials!,
                                                      23);
                                                }
                                              }))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatOne(
                                              Utils().getIndexForSeat(data, 24),
                                              seatwidth,
                                              data, () {
                                            int? index = Utils()
                                                .getIndexForSeat(data, 24);
                                            if (index == null &&
                                                data[userIndex!].seatNumber ==
                                                    0) {
                                              SharedController().addSeat(
                                                widget.currentime.toString(),
                                                24,
                                              );
                                            } else if (index == null) {
                                              UpdateSeatPopUp(
                                                  context,
                                                  widget.currentime.toString(),
                                                  24);
                                            } else if (data[userIndex!]
                                                    .seatNumber !=
                                                24) {
                                              SeatInfoPopUp(
                                                  context,
                                                  data[index].firstName!,
                                                  data[index].lastName!,
                                                  data[index].initials!,
                                                  24);
                                            }
                                          }),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatOne(
                                                  Utils().getIndexForSeat(
                                                      data, 25),
                                                  seatwidth,
                                                  data, () {
                                                int? index = Utils()
                                                    .getIndexForSeat(data, 25);
                                                if (index == null &&
                                                    data[userIndex!]
                                                            .seatNumber ==
                                                        0) {
                                                  SharedController().addSeat(
                                                    widget.currentime
                                                        .toString(),
                                                    25,
                                                  );
                                                } else if (index == null) {
                                                  UpdateSeatPopUp(
                                                      context,
                                                      widget.currentime
                                                          .toString(),
                                                      25);
                                                } else if (data[userIndex!]
                                                        .seatNumber !=
                                                    25) {
                                                  SeatInfoPopUp(
                                                      context,
                                                      data[index].firstName!,
                                                      data[index].lastName!,
                                                      data[index].initials!,
                                                      25);
                                                }
                                              }))
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
                                          seatTwo(
                                              Utils().getIndexForSeat(data, 26),
                                              seatwidth,
                                              data, () {
                                            int? index = Utils()
                                                .getIndexForSeat(data, 26);
                                            if (index == null &&
                                                data[userIndex!].seatNumber ==
                                                    0) {
                                              SharedController().addSeat(
                                                widget.currentime.toString(),
                                                26,
                                              );
                                            } else if (index == null) {
                                              UpdateSeatPopUp(
                                                  context,
                                                  widget.currentime.toString(),
                                                  26);
                                            } else if (data[userIndex!]
                                                    .seatNumber !=
                                                26) {
                                              SeatInfoPopUp(
                                                  context,
                                                  data[index].firstName!,
                                                  data[index].lastName!,
                                                  data[index].initials!,
                                                  26);
                                            }
                                          }),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatTwo(
                                                  Utils().getIndexForSeat(
                                                      data, 27),
                                                  seatwidth,
                                                  data, () {
                                                int? index = Utils()
                                                    .getIndexForSeat(data, 27);
                                                if (index == null &&
                                                    data[userIndex!]
                                                            .seatNumber ==
                                                        0) {
                                                  SharedController().addSeat(
                                                    widget.currentime
                                                        .toString(),
                                                    27,
                                                  );
                                                } else if (index == null) {
                                                  UpdateSeatPopUp(
                                                      context,
                                                      widget.currentime
                                                          .toString(),
                                                      27);
                                                } else if (data[userIndex!]
                                                        .seatNumber !=
                                                    27) {
                                                  SeatInfoPopUp(
                                                      context,
                                                      data[index].firstName!,
                                                      data[index].lastName!,
                                                      data[index].initials!,
                                                      27);
                                                }
                                              }))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          seatTwo(
                                              Utils().getIndexForSeat(data, 28),
                                              seatwidth,
                                              data, () {
                                            int? index = Utils()
                                                .getIndexForSeat(data, 28);
                                            if (index == null &&
                                                data[userIndex!].seatNumber ==
                                                    0) {
                                              SharedController().addSeat(
                                                widget.currentime.toString(),
                                                28,
                                              );
                                            } else if (index == null) {
                                              UpdateSeatPopUp(
                                                  context,
                                                  widget.currentime.toString(),
                                                  28);
                                            } else if (data[userIndex!]
                                                    .seatNumber !=
                                                28) {
                                              SeatInfoPopUp(
                                                  context,
                                                  data[index].firstName!,
                                                  data[index].lastName!,
                                                  data[index].initials!,
                                                  28);
                                            }
                                          }),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: width * 0.2),
                                              child: seatTwo(
                                                  Utils().getIndexForSeat(
                                                      data, 29),
                                                  seatwidth,
                                                  data, () {
                                                int? index = Utils()
                                                    .getIndexForSeat(data, 29);
                                                if (index == null &&
                                                    data[userIndex!]
                                                            .seatNumber ==
                                                        0) {
                                                  SharedController().addSeat(
                                                    widget.currentime
                                                        .toString(),
                                                    29,
                                                  );
                                                } else if (index == null) {
                                                  UpdateSeatPopUp(
                                                      context,
                                                      widget.currentime
                                                          .toString(),
                                                      29);
                                                } else if (data[userIndex!]
                                                        .seatNumber !=
                                                    29) {
                                                  SeatInfoPopUp(
                                                      context,
                                                      data[index].firstName!,
                                                      data[index].lastName!,
                                                      data[index].initials!,
                                                      29);
                                                }
                                              }))
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

  Widget seatOne(int? seatNumber, double width,
          List<SeatingAndFoodPlanModel> data, VoidCallback onTap) =>
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
                                    data[seatNumber].initials!,
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

  Widget seatTwo(int? seatNumber, double width,
          List<SeatingAndFoodPlanModel> data, VoidCallback onTap) =>
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
                                    data[seatNumber].initials!,
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
