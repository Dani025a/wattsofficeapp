// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> SeatInfoPopUp(BuildContext context, String firstName,
    String lastName, String initials, int seatNumber) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hvem har denne sideplads?'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //position
            mainAxisSize: MainAxisSize.min,
            // wrap content in flutter
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(top: 20),
                child: Row(
                  children: [
                    Text(
                      "Navn: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text("$firstName $lastName", style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 20),
                child: Row(
                  children: [
                    Text(
                      "Initialer: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(initials, style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsetsDirectional.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Siddeplads nummer: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(seatNumber.toString(),
                          style: TextStyle(fontSize: 20))
                    ],
                  ))
            ],
          ),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              MaterialButton(
                  height: 40,
                  minWidth: 100,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  color: Colors.red,
                  child: Text(
                    "OK",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ])
          ],
        );
      });
}
