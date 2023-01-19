// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:string_ext/string_ext.dart';
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/models/dateModel.dart';
import 'package:wattsofficeapp/utils/utils.dart';
import 'package:wattsofficeapp/views/Screens/floorPlanScreen.dart';
import 'package:wattsofficeapp/views/Wigdets/guestPopUp.dart';

import '../../Controllers/sharedController.dart';
import '../../models/seatingAndFoodPlanModel.dart';

class SeatingItemCard extends StatefulWidget {
  final int dateIndex;
  final List<DateModel> dateData;

  const SeatingItemCard({
    Key? key,
    required this.dateIndex,
    required this.dateData,
  }) : super(key: key);

  @override
  State<SeatingItemCard> createState() => _SeatingItemCardState();
}

class _SeatingItemCardState extends State<SeatingItemCard> {
  int guests = 0;
  int seatsAvaible = 29;
  int seatsTaken = 0;
  int numberOfMeals = 0;
  int whereAreYou = 1;
  int seatNumber = 0;
  int? userIndex = 0;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SeatingAndFoodPlanModel>>(
        stream: SharedController.getData(Utils.dateFormat
            .format(widget.dateData[widget.dateIndex].date!)
            .toString()),
        builder: (context, snapshot1) {
          final data = snapshot1.data;
          double width = MediaQuery.of(context).size.width;

          switch (snapshot1.connectionState) {
            case ConnectionState.waiting:
            default:
              date = widget.dateData[widget.dateIndex].date!;
              seatsTaken = widget.dateData[widget.dateIndex].seatsTaken!;
              numberOfMeals = widget.dateData[widget.dateIndex].seatsTaken!;
              if (data == null) {
              } else {
                userIndex = Utils().getUserInfo(data);
                if (userIndex != null) {
                  guests = data[userIndex!].guests!;
                  seatNumber = data[userIndex!].seatNumber!;
                  whereAreYou = data[userIndex!].whereAreYou!;
                }
              }

              return Column(children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0, width * 0.05, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${Utils.dayFormat.format(date).firstToUpper()} - ${Utils.dateFormat.format(date)}  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Column(
                                children: [
                                  if (seatsTaken < (seatsAvaible / 2))
                                    Text(
                                      "$seatsTaken/$seatsAvaible",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.05,
                                          color: Colors.green),
                                    )
                                  else if ((seatsTaken >= (seatsAvaible / 2)) &&
                                      seatsTaken < seatsAvaible)
                                    Text(
                                      "$seatsTaken/$seatsAvaible",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.05,
                                          color:
                                              Color.fromARGB(255, 230, 208, 1)),
                                    )
                                  else if (seatsTaken == seatsAvaible)
                                    Text(
                                      "$seatsTaken/$seatsAvaible",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.05,
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
                                SizedBox(
                                  height: width * 0.12,
                                  width: width * 0.30,
                                  child: FloatingActionButton.extended(
                                    label: Text(LocaleKeys.atOffice.tr()),
                                    extendedTextStyle:
                                        TextStyle(fontSize: width * 0.03),
                                    backgroundColor: whereAreYou == 0
                                        ? Colors.green
                                        : Colors.black,
                                    icon: Icon(
                                      Icons.business,
                                      color: whereAreYou == 0
                                          ? Colors.white
                                          : Colors.green,
                                      size: width * 0.06,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (whereAreYou != 0) {
                                          SharedController().addLocation(
                                              Utils.dateFormat
                                                  .format(date)
                                                  .toString(),
                                              0,
                                              false);
                                        }
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height: width * 0.12,
                                    width: width * 0.30,
                                    child: FloatingActionButton.extended(
                                      label: Text(LocaleKeys.atHome.tr()),
                                      extendedTextStyle:
                                          TextStyle(fontSize: width * 0.03),
                                      backgroundColor: whereAreYou == 1
                                          ? Color.fromARGB(255, 230, 208, 1)
                                          : Colors.black,
                                      icon: Icon(
                                        Icons.house,
                                        color: whereAreYou == 1
                                            ? Colors.white
                                            : Color.fromARGB(255, 230, 208, 1),
                                        size: width * 0.06,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (whereAreYou != 1) {
                                            SharedController().addLocation(
                                                Utils.dateFormat
                                                    .format(date)
                                                    .toString(),
                                                1,
                                                true);
                                          }
                                        });
                                      },
                                    )),
                                SizedBox(
                                    height: width * 0.12,
                                    width: width * 0.30,
                                    child: FloatingActionButton.extended(
                                      label:
                                          Text(LocaleKeys.sickOrVacation.tr()),
                                      extendedTextStyle:
                                          TextStyle(fontSize: width * 0.03),
                                      backgroundColor: whereAreYou == 2
                                          ? Colors.red
                                          : Colors.black,
                                      icon: Icon(
                                        Icons.close_outlined,
                                        color: whereAreYou == 2
                                            ? Colors.white
                                            : Colors.red,
                                        size: width * 0.06,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (whereAreYou != 2) {
                                            SharedController().addLocation(
                                                Utils.dateFormat
                                                    .format(date)
                                                    .toString(),
                                                2,
                                                true);
                                          }
                                        });
                                      },
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                  top: 20,
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (seatNumber == 0) ...[
                                  Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          bottom: width * 0.07),
                                      child: SizedBox(
                                          height: width * 0.12,
                                          width: width * 0.30,
                                          child: FloatingActionButton.extended(
                                            label: Text("Tilføj plads"),
                                            extendedTextStyle: TextStyle(
                                                fontSize: width * 0.03),
                                            backgroundColor: Colors.black,
                                            icon: Icon(
                                              Icons.desk,
                                              color: Colors.green,
                                              size: width * 0.06,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FloorPlanScreen(
                                                              currentime: date,
                                                              popup: true)));
                                            },
                                          ))),
                                ] else ...[
                                  Column(
                                    children: [
                                      SizedBox(
                                          height: width * 0.12,
                                          width: width * 0.33,
                                          child: FloatingActionButton.extended(
                                            label: Text("Rediger plads"),
                                            extendedTextStyle: TextStyle(
                                                fontSize: width * 0.03),
                                            backgroundColor: Colors.green,
                                            icon: Icon(
                                              Icons.desk,
                                              color: Colors.white,
                                              size: width * 0.06,
                                            ),
                                            onPressed: () {
                                              GuestPopUp(
                                                  context,
                                                  Utils.dateFormat
                                                      .format(date)
                                                      .toString(),
                                                  guests, numberOfMeals);
                                            },
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            SharedController().removeSeat(
                                              Utils.dateFormat
                                                  .format(date)
                                                  .toString(),
                                            );
                                          },
                                          child: Text(
                                            LocaleKeys.deleteSeat.tr(),
                                            style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                                if (guests == 0) ...[
                                  SizedBox(
                                      height: width * 0.12,
                                      width: width * 0.30,
                                      child: FloatingActionButton.extended(
                                        label: Text(LocaleKeys.addGuests.tr()),
                                        extendedTextStyle:
                                            TextStyle(fontSize: width * 0.03),
                                        backgroundColor: Colors.black,
                                        icon: Icon(
                                          Icons.people,
                                          color: Colors.blue,
                                          size: width * 0.06,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            GuestPopUp(
                                                context,
                                                Utils.dateFormat
                                                    .format(date)
                                                    .toString(),
                                                guests, numberOfMeals);
                                          });
                                        },
                                      )),
                                ] else ...[
                                  Column(
                                    children: [
                                      SizedBox(
                                          height: width * 0.12,
                                          width: width * 0.33,
                                          child: FloatingActionButton.extended(
                                            label: Text(
                                                LocaleKeys.editGuests.tr()),
                                            extendedTextStyle: TextStyle(
                                                fontSize: width * 0.03),
                                            backgroundColor: Colors.blue,
                                            icon: Icon(
                                              Icons.people,
                                              color: Colors.white,
                                              size: width * 0.06,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                GuestPopUp(
                                                    context,
                                                    Utils.dateFormat
                                                        .format(date)
                                                        .toString(),
                                                    guests, numberOfMeals);
                                              });
                                            },
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            SharedController().addGuests(
                                                Utils.dateFormat
                                                    .format(date)
                                                    .toString(),
                                                0, guests, numberOfMeals);
                                          },
                                          child: Text(
                                            LocaleKeys.delteGuests.tr(),
                                            style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                                Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        top: width * 0.04),
                                    child: Text(
                                      "${LocaleKeys.guests.tr()}: $guests",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.043),
                                    ))
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
        });
  }
}
