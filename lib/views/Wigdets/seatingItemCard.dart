// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/views/Screens/floorPlanScreen.dart';
import 'package:wattsofficeapp/views/Wigdets/guestPopUp.dart';

class SeatingItemCard extends StatefulWidget {
  final String currentime;
  const SeatingItemCard({Key? key, required this.currentime}) : super(key: key);

  @override
  State<SeatingItemCard> createState() => _SeatingItemCardState();
}

class _SeatingItemCardState extends State<SeatingItemCard> {
  int guests = 0;
  int seatsAvaible = 29;
  int seatsTaken = 29;
  int currentAnswer = 1;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xFFF5F5F5),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' - ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    " ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Column(
                      children: [
                        if (seatsTaken < (seatsAvaible / 2))
                          Text(
                            "$seatsTaken/$seatsAvaible",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.green),
                          )
                        else if ((seatsTaken >= (seatsAvaible / 2)) &&
                            seatsTaken < seatsAvaible)
                          Text(
                            "$seatsTaken/$seatsAvaible",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(255, 230, 208, 1)),
                          )
                        else if (seatsTaken == seatsAvaible)
                          Text(
                            "$seatsTaken/$seatsAvaible",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.red),
                          )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                    top: 10,
                  )),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton.extended(
                        label: Text('Kontoret'),
                        extendedTextStyle: TextStyle(fontSize: 10),
                        backgroundColor:
                            currentAnswer == 0 ? Colors.green : Colors.black,
                        icon: Icon(
                          Icons.business,
                          color:
                              currentAnswer == 0 ? Colors.white : Colors.green,
                          size: 24.0,
                        ),
                        onPressed: () {
                          setState(() {
                            if (seatsTaken == seatsAvaible) {
                              Get.snackbar(
                                "Ingen siddepladser tilbage",
                                "Du er stadig blevet tilføjet til madordningen.",
                                duration: Duration(seconds: 4),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                borderRadius: 10,
                                margin: const EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                              );
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FloorPlanScreen()));
                            }
                            currentAnswer = 0;
                          });
                        },
                      ),
                      FloatingActionButton.extended(
                        label: Text('Hjemme'),
                        extendedTextStyle: TextStyle(fontSize: 10),
                        backgroundColor: currentAnswer == 1
                            ? Color.fromARGB(255, 230, 208, 1)
                            : Colors.black,
                        icon: Icon(
                          Icons.house,
                          color: currentAnswer == 1
                              ? Colors.white
                              : Color.fromARGB(255, 230, 208, 1),
                          size: 24.0,
                        ),
                        onPressed: () {
                          setState(() {
                            currentAnswer = 1;
                          });
                        },
                      ),
                      FloatingActionButton.extended(
                        label: Text('Syg/Ferie'),
                        extendedTextStyle: TextStyle(fontSize: 10),
                        backgroundColor:
                            currentAnswer == 2 ? Colors.red : Colors.black,
                        icon: Icon(
                          Icons.close_outlined,
                          color: currentAnswer == 2 ? Colors.white : Colors.red,
                          size: 24.0,
                        ),
                        onPressed: () {
                          setState(() {
                            currentAnswer = 2;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton.extended(
                        label: Text('Tilføj Gæster'),
                        extendedTextStyle: TextStyle(fontSize: 10),
                        backgroundColor: Colors.black,
                        icon: Icon(
                          Icons.people,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                        onPressed: () {
                          GuestPopUp(context);
                        },
                      ),
                      Text(
                        "Gæster: $guests",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
